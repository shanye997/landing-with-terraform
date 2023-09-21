resource "alicloud_ots_instance" "foo" {
  name          = "${var.name}"
  description   = "${var.name}"
  accessed_by   = "Vpc"
  instance_type = "Capacity"
}

data "alicloud_zones" "foo" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.foo.zones.0.id
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.foo.zones.0.id
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_ots_instance_attachment" "foo" {
  instance_name = "${alicloud_ots_instance.foo.name}"
  vpc_name      = "testvpc"
  vswitch_id    = local.vswitch_id
}

data "alicloud_ots_instance_attachments" "default" {
  name_regex    = "${alicloud_ots_instance_attachment.foo.vpc_name}-fake"
  instance_name = alicloud_ots_instance_attachment.foo.instance_name
}
