terraform {
  required_providers {
    kong-gateway = {
      source  = "kong/kong-gateway"
    }
  }
}

resource "kong-gateway_service" "this" {
  host = var.service_host
  name = var.service_name
  path = var.service_path
  port = var.service_port
  protocol = "http"

  connect_timeout = 30000
  read_timeout = 30000
  write_timeout = 30000

  tags = [
    var.service_tag
  ]
}

resource "kong-gateway_route" "this" {
  name = "${var.service_name}-route"

  service = {
    id = kong-gateway_service.this.id
  }

  paths = [
    var.route_path
  ]

  tags = [
    var.service_tag
  ]
}