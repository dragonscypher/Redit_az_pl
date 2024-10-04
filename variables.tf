variable "resource_group_name" {
  description = "name of resource group"
  type = string
}

variable "location" {
  description = "location"
  type = string
}

variable "tags" {
  description = "tags associated with resource"
  type = map(string)
  default = {  }
}
variable "source_folder_name" {
  description = "source folder name"
  type = string
}

variable "destination_folder_name" {
  description = "destination folder name"
  type = string
}
variable "storage_account_name" {
  description = "storage account name"
  type = string
}

variable "df_name" {
  description = "data factory name"
  type = string
}

variable "source_container_name" {
  description = "The name of the source container in the Blob Storage"
  type        = string
}

variable "destination_container_name" {
  description = "The name of the destination container in the Blob Storage"
  type        = string
}
