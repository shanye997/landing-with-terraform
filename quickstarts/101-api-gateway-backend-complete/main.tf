resource "alicloud_api_gateway_backend" "default" {
  backend_name                            = var.backend_name_var
  backend_type                            = "HTTP"
  create_event_bridge_service_linked_role = "true"
  description                             = var.description_var
}
