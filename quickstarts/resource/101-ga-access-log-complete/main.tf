data "alicloud_ga_accelerators" "default" {
  status = "active"
}

resource "alicloud_log_project" "default" {
  name = var.name
}

resource "alicloud_log_store" "default" {
  project = alicloud_log_project.default.name
  name    = var.name
}

resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth      = 100
  type           = "Basic"
  bandwidth_type = "Basic"
  payment_type   = "PayAsYouGo"
  billing_type   = "PayBy95"
  ratio          = 30
}

resource "alicloud_ga_bandwidth_package_attachment" "default" {
  accelerator_id       = data.alicloud_ga_accelerators.default.accelerators.0.id
  bandwidth_package_id = alicloud_ga_bandwidth_package.default.id
}

resource "alicloud_ga_listener" "default" {
  accelerator_id = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  port_ranges {
    from_port = 80
    to_port   = 80
  }
}

resource "alicloud_eip_address" "default" {
  payment_type = "PayAsYouGo"
}

resource "alicloud_ga_endpoint_group" "default" {
  accelerator_id = alicloud_ga_listener.default.accelerator_id
  endpoint_configurations {
    endpoint = alicloud_eip_address.default.ip_address
    type     = "PublicIp"
    weight   = 20
  }
  endpoint_group_region = "cn-hangzhou"
  listener_id           = alicloud_ga_listener.default.id
}

resource "alicloud_ga_access_log" "default" {
  sls_region_id      = "cn-hangzhou"
  accelerator_id     = data.alicloud_ga_accelerators.default.accelerators.0.id
  endpoint_group_id  = alicloud_ga_endpoint_group.default.id
  listener_id        = alicloud_ga_listener.default.id
  sls_log_store_name = alicloud_log_store.default.name
  sls_project_name   = alicloud_log_project.default.name
}
