variable "name" {
  default = "tf-example"
}

data "alicloud_ecp_zones" "default" {}
data "alicloud_ecp_instance_types" "default" {}
resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.0.0.0/8"
}
resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.1.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_ecp_zones.default.zones.0.zone_id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = alicloud_vpc.default.id
}
resource "alicloud_ecp_key_pair" "default" {
  key_pair_name   = var.name
  public_key_body = "ssh-rsa AAAAB3Nza12345678qwertyuudsfsg"
}

resource "alicloud_ecp_instance" "default" {
  instance_name     = var.name
  description       = var.name
  key_pair_name     = alicloud_ecp_key_pair.default.key_pair_name
  security_group_id = alicloud_security_group.default.id
  vswitch_id        = alicloud_vswitch.default.id
  image_id          = "android_9_0_0_release_2851157_20211201.vhd"
  instance_type     = data.alicloud_ecp_instance_types.default.instance_types.1.instance_type
  vnc_password      = "Ecp123"
  payment_type      = "PayAsYouGo"
}