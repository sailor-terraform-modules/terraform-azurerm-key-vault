data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "key_vault" {
  name                          = var.name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  enabled_for_disk_encryption   = true
  tenant_id                     = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days    = var.soft_delete_retention_days
  purge_protection_enabled      = var.purge_protection_enabled
  enable_rbac_authorization     = false
  public_network_access_enabled = var.public_network_access_enabled
  sku_name                      = var.sku_name
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "SetRotationPolicy",
    ]
    secret_permissions = [
      "Get", "Set", "List", "Delete", "Restore"
    ]
    storage_permissions = [
      "Get",
    ]
  }
  network_acls {
    bypass         = "AzureServices"
    default_action = "Allow"

  }
}



resource "azurerm_monitor_diagnostic_setting" "monitor" {
  name               = var.monitor_name
  target_resource_id = azurerm_key_vault.key_vault.id
  storage_account_id = azurerm_storage_account.storage.id

  log {
    category = "AuditEvent"
    enabled  = true
  }
}