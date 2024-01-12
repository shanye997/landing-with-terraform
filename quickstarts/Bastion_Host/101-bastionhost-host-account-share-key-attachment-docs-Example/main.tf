variable "name" {
  default = "tf_example"
}
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  vpc_id = alicloud_vpc.default.id
}
resource "alicloud_bastionhost_instance" "default" {
  description        = var.name
  license_code       = "bhah_ent_50_asset"
  plan_code          = "cloudbastion"
  storage            = "5"
  bandwidth          = "5"
  period             = "1"
  vswitch_id         = alicloud_vswitch.default.id
  security_group_ids = [alicloud_security_group.default.id]
}

resource "alicloud_bastionhost_host" "default" {
  instance_id          = alicloud_bastionhost_instance.default.id
  host_name            = var.name
  active_address_type  = "Private"
  host_private_address = "172.16.0.10"
  os_type              = "Linux"
  source               = "Local"
}

resource "alicloud_bastionhost_host_account" "default" {
  host_account_name = var.name
  host_id           = alicloud_bastionhost_host.default.host_id
  instance_id       = alicloud_bastionhost_host.default.instance_id
  protocol_name     = "SSH"
  password          = "YourPassword12345"
}

variable "private_key" {
  default = "LS0tLS1CR*******"
}
resource "alicloud_bastionhost_host_share_key" "default" {
  host_share_key_name = var.name
  instance_id         = alicloud_bastionhost_instance.default.id
  pass_phrase         = "NTIxeGlubXU="
  private_key         = var.private_key
}

resource "alicloud_bastionhost_host_account_share_key_attachment" "default" {
  instance_id       = alicloud_bastionhost_instance.default.id
  host_share_key_id = alicloud_bastionhost_host_share_key.default.host_share_key_id
  host_account_id   = alicloud_bastionhost_host_account.default.host_account_id
}