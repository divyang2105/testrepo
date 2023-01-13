resource "azurerm_resource_group" "synapse_rg" {
  name = "${var.environment}-${var.resource_group_name}-rg"
  location = var.location

  tags = {
    "environment" = "dev"
  }
}
