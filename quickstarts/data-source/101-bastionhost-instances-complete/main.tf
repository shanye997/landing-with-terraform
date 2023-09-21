data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

resource "alicloud_security_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  name   = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.this.*.id, [""])[0]
}

resource "alicloud_bastionhost_instance" "default" {
  description        = "${var.name}"
  license_code       = "bhah_ent_50_asset"
  period             = "1"
  vswitch_id         = local.vswitch_id
  security_group_ids = ["${alicloud_security_group.default.id}"]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_bastionhost_instances" "default" {
  tags = {
    For = "acceptance test-fake"
  }
  description_regex = "${alicloud_bastionhost_instance.default.description}-fake"
  ids = [
    "${alicloud_bastionhost_instance.default.id}-fake"
  ]
}
