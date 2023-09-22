resource "alicloud_vpc" "OeB4be" {
  vpc_name    = var.name
  enable_ipv6 = true
  cidr_block  = "172.16.0.0/12"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vswitch" "default" {
  ipv6_cidr_block_mask = var.ipv6_cidr_block_mask_var
  enable_ipv6          = var.enable_ipv6_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  vpc_id       = alicloud_vpc.OeB4be.id
  vswitch_name = var.vswitch_name_var
  zone_id      = data.alicloud_zones.default.zones.0.id
  cidr_block   = "172.16.0.0/24"
  description  = var.description_var
}
