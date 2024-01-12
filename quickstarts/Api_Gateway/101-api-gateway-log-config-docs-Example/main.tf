data "alicloud_api_gateway_log_configs" "default" {
  log_type = "PROVIDER"
}
locals {
  count = length(data.alicloud_api_gateway_log_configs.default.configs) > 0 ? 0 : 1
}

resource "random_integer" "default" {
  count = local.count
  max   = 99999
  min   = 10000
}

resource "alicloud_log_project" "example" {
  count       = local.count
  name        = "terraform-example-${random_integer.default[0].result}"
  description = "terraform-example"
}

resource "alicloud_log_store" "example" {
  count                 = local.count
  project               = alicloud_log_project.example[0].name
  name                  = "terraform-example"
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_api_gateway_log_config" "example" {
  count         = local.count
  sls_project   = alicloud_log_project.example[0].name
  sls_log_store = alicloud_log_store.example[0].name
  log_type      = "PROVIDER"
}