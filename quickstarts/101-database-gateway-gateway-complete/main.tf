resource "alicloud_database_gateway_gateway" "default" {
  gateway_name = var.gateway_name_var
  gateway_desc = var.gateway_desc_var
}
