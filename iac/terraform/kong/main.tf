module "service_and_route" {
  source = "./modules/service_and_route"

  for_each = local.services

  service_host = each.value.host
  service_name = each.value.name
  service_path = each.value.service_path
  service_port = each.value.service_port
  service_tag = each.value.service_tag
  route_path = each.value.route_path
}