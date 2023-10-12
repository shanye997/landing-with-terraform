resource "alicloud_api_gateway_backend" "default" {
  backend_type = "HTTP"
  backend_name = var.backend_name_var
}
