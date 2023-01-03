data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keyvault" {
  name                        = "${azurerm_resource_group.synapse_rg.name}-keyvault"
  location                    = azurerm_resource_group.synapse_rg.location
  resource_group_name         = azurerm_resource_group.synapse_rg.name
  enabled_for_disk_encryption = false
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 15
  purge_protection_enabled    = false
  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = ["Get"]
    secret_permissions = ["Get", "List", "Set", "Delete"]
    storage_permissions = ["Get"]
  }

  network_acls {
     default_action = "Allow" 
     bypass         = "AzureServices" 
   }
}


