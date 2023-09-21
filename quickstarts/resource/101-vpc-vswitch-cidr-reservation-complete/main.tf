data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "defaultVpc" {
  vpc_name   = var.name
  cidr_block = "10.0.0.0/8"
}

resource "alicloud_vswitch" "defaultVSwitch" {
  vpc_id       = alicloud_vpc.defaultVpc.id
  cidr_block   = "10.0.0.0/20"
  vswitch_name = "${var.name}1"
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vpc_vswitch_cidr_reservation" "default" {
  vswitch_id                    = alicloud_vswitch.defaultVSwitch.id
  cidr_reservation_cidr         = "10.0.10.0/24"
  cidr_reservation_description  = var.cidr_reservation_description_var
  cidr_reservation_mask         = "24"
  cidr_reservation_type         = "Prefix"
  ip_version                    = "IPv4"
  vswitch_cidr_reservation_name = var.vswitch_cidr_reservation_name_var
}
