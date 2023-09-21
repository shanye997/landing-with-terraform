resource "alicloud_api_gateway_plugin" "default" {
  plugin_name = var.name
  plugin_type = "cors"
  plugin_data = var.plugin_data_var
}
