resource "azurerm_storage_account" "azstorage" {
  name                     = "${var.environment}${var.resource_group_name}storage2105"
  resource_group_name      = azurerm_resource_group.synapse_rg.name
  location                 = azurerm_resource_group.synapse_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "fs" {
  name               = "development"
  storage_account_id = azurerm_storage_account.azstorage.id
}

resource "azurerm_synapse_workspace" "synapse" {
  name                                 = "${azurerm_resource_group.synapse_rg.name}-synapse"
  resource_group_name                  = azurerm_resource_group.synapse_rg.name
  location                             = azurerm_resource_group.synapse_rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.fs.id
  sql_administrator_login              = azurerm_key_vault_secret.sql-pwd.name
  sql_administrator_login_password     = azurerm_key_vault_secret.sql-pwd.value

  identity {
    type = "SystemAssigned"
  }
  depends_on = [
    azurerm_key_vault_secret.sql-pwd
  ]
}

resource "azurerm_synapse_sql_pool" "sql_pool" {
  name                 = var.synapse_sql_pool
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  sku_name             = "DW100c"
  create_mode          = "Default"
  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}

resource "azurerm_synapse_spark_pool" "spark_pool" {
  name                 = var.synapse_spark_pool
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  node_size_family     = "MemoryOptimized"
  node_size            = "Small"

  auto_scale {
    max_node_count = 50
    min_node_count = 3
  }
  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}

resource "azurerm_synapse_firewall_rule" "access_rule" {
  name                 = "AllowAll"
  synapse_workspace_id = azurerm_synapse_workspace.synapse.id
  start_ip_address     = "0.0.0.0"
  end_ip_address       = "255.255.255.255"
  depends_on = [
    azurerm_synapse_workspace.synapse
  ]
}

