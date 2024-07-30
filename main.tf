resource "azurerm_monitor_data_collection_endpoint" "example" {
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