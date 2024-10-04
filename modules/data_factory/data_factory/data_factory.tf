resource "azurerm_data_factory" "adf"{
    name                = var.df_name
    resource_group_name =  var.resource_group_name
    location = var.location

    identity{
        type = "SystemAssigned"
    }

}

data "azurerm_storage_account" "source_folder_storage"{
    name                = var.storage_account_name
    resource_group_name = var.resource_group_name
}

data "azurerm_storage_account" "destination_folder_storage"{
    name                = var.storage_account_name
    resource_group_name = var.resource_group_name
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "source"{
    
    data_factory_id = azurerm_data_factory.adf.id
    name = "source-storage"
    connection_string = data.azurerm_storage_account.source_folder_storage.primary_connection_string
}

resource "azurerm_data_factory_linked_service_azure_blob_storage" "destination"{
    
    data_factory_id = azurerm_data_factory.adf.id
    name = "destination-storage"
    connection_string = data.azurerm_storage_account.destination_folder_storage.primary_connection_string

}

resource "azurerm_data_factory_dataset_delimited_text" "source_dataset" {
    name = "source_dataset"
    data_factory_id = azurerm_data_factory.adf.id
    linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.source.name
  
      azure_blob_storage_location {
    container = var.source_container_name
    path = var.source_folder_name
    filename = "the-reddit-dataset-dataset-comments.csv"
  }

}

resource "azurerm_data_factory_dataset_delimited_text" "destination_dataset" {
    name = "destination_dataset"
    data_factory_id = azurerm_data_factory.adf.id
    linked_service_name = azurerm_data_factory_linked_service_azure_blob_storage.destination.name
  
      azure_blob_storage_location {
    container = var.destination_container_name
    path = var.destination_folder_name
    filename = "sentiment-analysis-results.csv"
  }

}

resource "azurerm_data_factory_pipeline" "copy_data" {
    name = "copy_data_pipeline"
    data_factory_id = azurerm_data_factory.adf.id

  activities_json = <<JSON
[
  {
    "name": "ExtractData",
    "type": "Copy",
    "inputs": [{"referenceName": "source_dataset", "type": "DatasetReference"}],
    "outputs": [{"referenceName": "intermediate_dataset", "type": "DatasetReference"}],
    "typeProperties": {
      "source": {"type": "DelimitedTextSource"},
      "sink": {"type": "DelimitedTextSink"}
    }
  },
  {
    "name": "TransformData",
    "type": "DataFlow",
    "inputs": [{"referenceName": "intermediate_dataset", "type": "DatasetReference"}],
    "outputs": [{"referenceName": "destination_dataset", "type": "DatasetReference"}],
    "typeProperties": {
      "transformation": {
        "script": "dataframe = dataframe.groupBy('Sentiment').count()"
      }
    }
  }
]
JSON
  depends_on = [
    azurerm_data_factory_dataset_delimited_text.source_dataset,
    azurerm_data_factory_dataset_delimited_text.destination_dataset
  ]
}
