variable "resource_group_name" {
    default = "synapse"
    description = "This is resource group name"
    type = string
}

variable "location" {
    default = "eastus"
    description = "Resource will create under this location"
    type = string
}

variable "environment" {
    default = "dev"
    description = "it defines environment"
    type = string
}


variable "secret_name" {
  type        = string
  default     = "sqladminuser"
  description = "Key Vault Secret name in Azure"
}

variable "secret_value" {
  type        = string
  description = "Key Vault Secret value in Azure"
  sensitive   = true
}

variable "synapse_sql_pool" {
  type = string
  description = "Sql Pool name in Azure Synapse"
  default = "syapasesqlpool"
}

variable "synapse_spark_pool" {
  type = string
  description = "Spark Pool name in Azure Synapse"
  default = "sparkpool"
}
