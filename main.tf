resource "azurerm_monitor_data_collection_endpoint" "this" {
  location                      = var.location
  name                          = var.name
  resource_group_name           = var.resource_group_name
  kind                          = var.kind
  public_network_access_enabled = var.public_network_access_enabled
  tags                          = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

moved {
  from = azurerm_monitor_data_collection_endpoint.example
  to   = azurerm_monitor_data_collection_endpoint.this
}