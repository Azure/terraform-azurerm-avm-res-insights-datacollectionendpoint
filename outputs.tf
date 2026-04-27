output "configuration_access_endpoint" {
  description = "The endpoint used for accessing configuration."
  value       = try(azapi_resource.this.output.properties.configurationAccess.endpoint, null)
}

output "logs_ingestion_endpoint" {
  description = "The endpoint used for ingesting logs."
  value       = try(azapi_resource.this.output.properties.logsIngestion.endpoint, null)
}

output "metrics_ingestion_endpoint" {
  description = "The endpoint used for ingesting metrics."
  value       = try(azapi_resource.this.output.properties.metricsIngestion.endpoint, null)
}

output "name" {
  description = "The name of the data collection endpoint."
  value       = azapi_resource.this.name
}

output "resource" {
  description = "This is the full output for the resource."
  value       = azapi_resource.this
}

output "resource_id" {
  description = "The resource ID of the data collection endpoint."
  value       = azapi_resource.this.id
}
