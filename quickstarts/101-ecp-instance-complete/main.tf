data "alicloud_ecp_zones" "default" {
}

data "alicloud_ecp_instance_types" "default" {
}

locals {
  count_size               = length(data.alicloud_ecp_zones.default.zones)
  zone_id                  = data.alicloud_ecp_zones.default.zones[local.count_size - 1].zone_id
  instance_type_count_size = length(data.alicloud_ecp_instance_types.default.instance_types)
  instance_type            = data.alicloud_ecp_instance_types.default.instance_types[local.instance_type_count_size - 1].instance_type
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = local.zone_id
}

resource "alicloud_security_group" "group" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_ecp_key_pair" "default" {
  count           = 2
  key_pair_name   = join("", [var.name, count.index])
  public_key_body = "ssh-rsa AAAAB3Nza12345678qwertyuudsfsg"
}

resource "alicloud_ecp_instance" "default" {
  key_pair_name     = alicloud_ecp_key_pair.default.0.key_pair_name
  vswitch_id        = data.alicloud_vswitches.default.ids.0
  vnc_password      = var.vnc_password_var
  image_id          = "android_9_0_0_release_2851157_20211201.vhd"
  instance_name     = var.instance_name_var
  force             = var.force_var
  status            = var.status_var
  security_group_id = alicloud_security_group.group.id
  description       = var.description_var
  payment_type      = var.payment_type_var
  instance_type     = local.instance_type
}
