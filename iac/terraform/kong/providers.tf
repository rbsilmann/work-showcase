terraform {
  required_providers {
    kong-gateway = {
      source  = "kong/kong-gateway"
      version = "0.5.2"
    }
  }
}

provider "kong-gateway" {
  server_url = var.server_url
}