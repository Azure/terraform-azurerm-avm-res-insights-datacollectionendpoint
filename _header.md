# terraform-azurerm-avm-res-insights-datacollectionendpoint

This module deploys an Azure Monitor Data Collection Endpoint (DCE) using the AzAPI provider.

Data Collection Endpoints define the ingestion and configuration access endpoints for Azure Monitor data collection. They provide the network endpoints that agents and SDKs connect to for sending monitoring data and retrieving configuration.

## Features

- Full support for Data Collection Endpoint configuration
- Public network access control (Enabled, Disabled, SecuredByPerimeter)
- Managed identity support (system-assigned and user-assigned)
- Resource locks and role assignments via AVM interfaces module
- Diagnostic settings
- AVM telemetry
