provider "alicloud" {
  alias  = "sz"
  region = "cn-shenzhen"
}

data "alicloud_vpcs" "default" {
  provider   = "alicloud.sz"
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  provider = "alicloud.sz"
  vpc_id   = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "default" {
  provider = "alicloud.sz"
  vpc_id   = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_ecs_network_interface" "default" {
  provider           = "alicloud.sz"
  vswitch_id         = data.alicloud_vswitches.default.ids.0
  security_group_ids = [alicloud_security_group.default.id]
}

resource "alicloud_ga_basic_accelerator" "default" {
  duration               = 1
  pricing_cycle          = "Month"
  basic_accelerator_name = var.name
  description            = var.name
  bandwidth_billing_type = "CDT"
  auto_pay               = true
  auto_use_coupon        = "true"
  auto_renew             = false
  auto_renew_duration    = 1
}

resource "alicloud_ga_basic_endpoint_group" "default" {
  accelerator_id        = alicloud_ga_basic_accelerator.default.id
  endpoint_group_region = "cn-shenzhen"
}

resource "alicloud_ga_basic_endpoint" "default" {
  endpoint_address  = alicloud_ecs_network_interface.default.id
  accelerator_id    = alicloud_ga_basic_accelerator.default.id
  endpoint_type     = "ENI"
  provider          = "alicloud.hz"
  endpoint_group_id = alicloud_ga_basic_endpoint_group.default.id
}
