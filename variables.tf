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
