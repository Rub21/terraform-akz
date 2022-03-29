terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.48.0"
    }
  }
}
provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "osm-seed-${var.env_name}-rg"
  location = "northeurope"
}

resource "azurerm_kubernetes_cluster" "cluster" {
  name                =  "${var.cluster_name}-${var.env_name}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "osm-seed"

  default_node_pool {
    name       = "default"
    node_count = "${var.num_cluster_nodes}"
    vm_size    = "${var.instance_type}"
  }

  identity {
    type = "SystemAssigned"
  }

  addon_profile {
    http_application_routing {
      enabled = true
    }
  }
}
