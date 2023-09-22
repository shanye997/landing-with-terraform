data "alicloud_cr_ee_instances" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_cr_vpc_endpoint_linked_vpc" "default" {
  vpc_id      = data.alicloud_vpcs.default.ids.0
  module_name = "Registry"
  instance_id = data.alicloud_cr_ee_instances.default.ids.0
  vswitch_id  = data.alicloud_vswitches.default.ids.0
}
