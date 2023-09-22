data "alicloud_instance_types" "default" {
  cpu_core_count = 1
  memory_size    = 2
}

data "alicloud_images" "default" {
  name_regex = "^ubuntu*"
  owners     = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  image_id        = "${data.alicloud_images.default.ids[0]}"
  instance_type   = "${data.alicloud_instance_types.default.ids[0]}"
  security_groups = "${[alicloud_security_group.default.id]}"
  vswitch_id      = local.vswitch_id
  instance_name   = "${var.name}"
}

resource "alicloud_image" "default" {
  instance_id = "${alicloud_instance.default.id}"
  image_name  = "${var.name}"
}

resource "alicloud_image_share_permission" "default" {
  account_id = ""
  image_id   = alicloud_image.default.id
}
