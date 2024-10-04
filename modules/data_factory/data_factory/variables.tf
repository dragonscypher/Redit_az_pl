variable "storage_account_name" {
  description = "storage account name"
  type = string
}

variable "resource_group_name" {
  description = "name of resource group"
  type = string
}
variable "location" {
  description = "location"
  type = string
}

variable "df_name" {
  description = "data factory name"
  type = string
}

variable "source_folder_name" {
  description = "source folder name"
  type = string
}

variable "destination_folder_name" {
  description = "destination folder name"
  type = string
}

variable "source_container_name" {
  description = "Name of the Azure Blob Storage container for the source dataset"
  type        = string
}

variable "destination_container_name" {
  description = "Name of the Azure Blob Storage container for the destination dataset"
  type        = string
}
