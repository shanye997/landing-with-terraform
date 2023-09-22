data "alicloud_zones" default {
  available_resource_creation = "Instance"
}

data "alicloud_instance_types" "default" {
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_images" "default" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
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

resource "alicloud_disk" "default" {
  count             = "2"
  disk_name         = "${var.name}"
  availability_zone = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  category          = "cloud_efficiency"
  size              = "20"
}

resource "alicloud_disk_attachment" "default" {
  count       = "2"
  disk_id     = "${element(alicloud_disk.default.*.id, count.index)}"
  instance_id = alicloud_instance.default.id
}

resource "alicloud_ecs_snapshot" "default" {
  category       = "standard"
  description    = "Test For Terraform"
  disk_id        = alicloud_disk_attachment.default.0.disk_id
  retention_days = "20"
  snapshot_name  = var.name
  tags = {
    Created = "TF"
    For     = "Acceptance-test"
  }
}

resource "alicloud_image" "default" {
  description = var.description_var
  image_name  = var.image_name_var
  snapshot_id = alicloud_ecs_snapshot.default.id
  tags = {
    Created = "TF"
    For     = "acceptance test123"
  }
}
