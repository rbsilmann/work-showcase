locals {
  services = {
    "admin-api" = {
      host = "localhost"
      name = "admin-api"
      service_path = "/"
      service_port = 8001
      service_tag = "admin"
      route_path = "/admin-api"
    },
    "rabbitmq" = {
      host = "rabbitmq"
      name = "rabbitmq-management"
      service_path = "/"
      service_port = 15672
      service_tag = "rabbitmq"
      route_path = "/rabbitmq"
    },
    "rabbitmq-metrics" = {
      host = "rabbitmq"
      name = "rabbitmq-metrics"
      service_path = "/metrics"
      service_port = 15692
      service_tag = "sre"
      route_path = "/rabbitmq-metrics"
    }
  }
}