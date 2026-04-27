mock_provider "azapi" {
  mock_resource "azapi_resource" {
    defaults = {
      id       = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test/providers/Microsoft.Insights/dataCollectionEndpoints/test-dce"
      name     = "test-dce"
      location = "eastus"
      output   = {}
    }
  }

  mock_data "azapi_client_config" {
    defaults = {
      subscription_id          = "00000000-0000-0000-0000-000000000000"
      subscription_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000"
      tenant_id                = "00000000-0000-0000-0000-000000000001"
    }
  }
}
mock_provider "modtm" {
  mock_data "modtm_module_source" {
    defaults = {
      module_source  = "registry.terraform.io/Azure/avm-res-insights-datacollectionendpoint/azurerm"
      module_version = "0.1.0"
    }
  }
}
mock_provider "random" {
  mock_resource "random_uuid" {
    defaults = {
      result = "00000000-0000-0000-0000-000000000000"
    }
  }
}

variables {
  location         = "eastus"
  name             = "test-dce"
  parent_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test"
  enable_telemetry = true
}

run "basic_dce_creation" {
  command = apply

  assert {
    condition     = azapi_resource.this.name == "test-dce"
    error_message = "DCE name should be 'test-dce'."
  }

  assert {
    condition     = azapi_resource.this.location == "eastus"
    error_message = "DCE location should be 'eastus'."
  }

  assert {
    condition     = output.name == "test-dce"
    error_message = "Output name should be 'test-dce'."
  }

  assert {
    condition     = output.resource_id != ""
    error_message = "Output resource_id should not be empty."
  }
}

run "telemetry_enabled_by_default" {
  command = apply

  assert {
    condition     = length(modtm_telemetry.telemetry) == 1
    error_message = "Telemetry resource should be created when enable_telemetry is true (default)."
  }
}

run "telemetry_disabled" {
  command = apply

  variables {
    enable_telemetry = false
  }

  assert {
    condition     = length(modtm_telemetry.telemetry) == 0
    error_message = "Telemetry resource should not be created when enable_telemetry is false."
  }
}

run "lock_creation" {
  command = apply

  variables {
    lock = {
      kind = "CanNotDelete"
      name = "test-lock"
    }
  }

  assert {
    condition     = length(azapi_resource.lock) == 1
    error_message = "Lock resource should be created when lock is specified."
  }
}

run "no_lock_by_default" {
  command = apply

  assert {
    condition     = length(azapi_resource.lock) == 0
    error_message = "Lock resource should not be created when lock is null."
  }
}
