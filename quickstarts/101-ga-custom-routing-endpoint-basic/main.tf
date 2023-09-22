data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_ga_accelerators" "default" {
  status = "active"
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
  listener_type  = "CustomRouting"
  port_ranges {
    from_port = 10000
    to_port   = 16000
  }
}

resource "alicloud_ga_custom_routing_endpoint_group" "default" {
  accelerator_id                     = alicloud_ga_listener.default.accelerator_id
  listener_id                        = alicloud_ga_listener.default.id
  endpoint_group_region              = "cn-hangzhou"
  custom_routing_endpoint_group_name = var.name
  description                        = var.name
}

resource "alicloud_ga_custom_routing_endpoint" "default" {
  type              = "PrivateSubNet"
  endpoint          = data.alicloud_vswitches.default.ids.0
  endpoint_group_id = alicloud_ga_custom_routing_endpoint_group.default.id
}
