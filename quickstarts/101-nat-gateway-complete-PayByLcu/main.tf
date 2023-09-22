data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = "172.16.0.0/21"
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

resource "alicloud_nat_gateway" "default" {
  vpc_id               = alicloud_vpc.default.id
  eip_bind_mode        = var.eip_bind_mode_var
  vswitch_id           = alicloud_vswitch.default.id
  nat_type             = var.nat_type_var
  network_type         = var.network_type_var
  internet_charge_type = "PayByLcu"
  specification        = var.specification_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  nat_gateway_name    = var.name
  deletion_protection = var.deletion_protection_var
  description         = var.description_var
}
