output "configuration_access_endpoint" {
  description = "TThe endpoint used for accessing configuration."
  value       = azurerm_monitor_data_collection_endpoint.example.configuration_access_endpoint
}

output "immutable_id" {
  description = "The immutable ID of the Data Collection Endpoint."
  value       = azurerm_monitor_data_collection_endpoint.example.immutable_id
}

output "logs_ingestion_endpoint" {
  description = "The endpoint used for ingesting logs"
  value       = azurerm_monitor_data_collection_endpoint.example.logs_ingestion_endpoint
}

output "resource_id" {
  description = "This is the full output for the resource."
  value       = azurerm_monitor_data_collection_endpoint.example.id
}
