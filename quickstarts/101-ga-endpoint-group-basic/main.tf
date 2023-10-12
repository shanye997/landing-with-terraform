data "alicloud_ga_accelerators" "default" {
  status = "active"
}

resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = 100
  type                   = "Basic"
  bandwidth_type         = "Enhanced"
  payment_type           = "PayAsYouGo"
  billing_type           = "PayBy95"
  ratio                  = 30
  bandwidth_package_name = var.name
}

resource "alicloud_ga_bandwidth_package_attachment" "default" {
  // Please run resource ga_accelerator test case to ensure this account has at least one accelerator before run this case.
  accelerator_id       = data.alicloud_ga_accelerators.default.ids.0
  bandwidth_package_id = alicloud_ga_bandwidth_package.default.id
}

resource "alicloud_ga_listener" "default" {
  port_ranges {
    from_port = "60"
    to_port   = "60"
  }
  accelerator_id  = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  client_affinity = "SOURCE_IP"
  protocol        = "HTTP"
  name            = var.name
}

resource "alicloud_eip_address" "default" {
  count                = 2
  bandwidth            = "10"
  internet_charge_type = "PayByBandwidth"
  address_name         = var.name
}

resource "alicloud_ga_endpoint_group" "default" {
  listener_id = alicloud_ga_listener.default.id
  endpoint_configurations {
    weight                       = "20"
    enable_clientip_preservation = "false"
    enable_proxy_protocol        = "true"
    endpoint                     = alicloud_eip_address.default.0.ip_address
    type                         = "PublicIp"
  }

  accelerator_id        = alicloud_ga_listener.default.accelerator_id
  endpoint_group_region = "cn-hangzhou"
}
