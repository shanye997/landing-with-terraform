resource "alicloud_api_gateway_plugin" "default" {
  plugin_data = var.plugin_data_var
  plugin_name = var.name
  plugin_type = "cors"
  tags = {
    Created = "tfexample5"
    For     = "Tfexample 5"
  }
  description = var.name
}
