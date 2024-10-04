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

variable "source_folder_name" {
  description = "source folder name"
  type = string
}

variable "destination_folder_name" {
  description = "destination folder name"
  type = string
}

variable "container_access_type" {
  description = "acess type for the storage account"
  type = string
  default = "private"
}
