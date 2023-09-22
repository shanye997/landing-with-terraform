resource "alicloud_config_aggregator" "default" {
  aggregator_name = var.name
  aggregator_type = "RD"
  description     = var.description_var
}
