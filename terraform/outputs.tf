output "resource_group_name" {
  value = azurerm_resource_group.synapse_rg.name
}

output "resource_group_id" {
  value = azurerm_resource_group.synapse_rg.id
}

output "keyvault_id" {
  value = azurerm_key_vault.keyvault.id
}

output "keyvault_uri" {
  value = azurerm_key_vault.keyvault.vault_uri
}

output "synapse_workspace_endpoint" {
  value = azurerm_synapse_workspace.synapse.connectivity_endpoints
}

