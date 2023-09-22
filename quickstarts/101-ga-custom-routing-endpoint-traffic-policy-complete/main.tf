data "alicloud_zones" "default" {
}

data "alicloud_ga_accelerators" "default" {
  status = "active"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "192.168.192.0/24"
  zone_id      = data.alicloud_zones.default.ids.0
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
    to_port   = 26000
  }
}

resource "alicloud_ga_custom_routing_endpoint_group" "default" {
  accelerator_id                     = alicloud_ga_listener.default.accelerator_id
  listener_id                        = alicloud_ga_listener.default.id
  endpoint_group_region              = "cn-hangzhou"
  custom_routing_endpoint_group_name = var.name
  description                        = var.name
}

resource "alicloud_ga_custom_routing_endpoint_group_destination" "default" {
  endpoint_group_id = alicloud_ga_custom_routing_endpoint_group.default.id
  protocols         = ["TCP"]
  from_port         = 1
  to_port           = 10
}

resource "alicloud_ga_custom_routing_endpoint" "default" {
  endpoint_group_id          = alicloud_ga_custom_routing_endpoint_group_destination.default.endpoint_group_id
  endpoint                   = alicloud_vswitch.default.id
  type                       = "PrivateSubNet"
  traffic_to_endpoint_policy = "AllowAll"
}

resource "alicloud_ga_custom_routing_endpoint_traffic_policy" "default" {
  address     = var.address_var
  endpoint_id = alicloud_ga_custom_routing_endpoint.default.custom_routing_endpoint_id
  port_ranges {
    from_port = "2"
    to_port   = "6"
  }

}
