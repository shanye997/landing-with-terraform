variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "cn-shenzhen"
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "defaultikZ0gD" {
  cidr_block = "172.16.0.0/12"
  vpc_name   = var.name
}

resource "alicloud_vswitch" "defaultp4O7qi" {
  vpc_id       = alicloud_vpc.defaultikZ0gD.id
  cidr_block   = "172.16.6.0/24"
  vswitch_name = var.name
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_nat_gateway" "default2iRZpC" {
  eip_bind_mode    = "MULTI_BINDED"
  vpc_id           = alicloud_vpc.defaultikZ0gD.id
  nat_gateway_name = var.name
  payment_type     = "PayAsYouGo"
  vswitch_id       = alicloud_vswitch.defaultp4O7qi.id
  nat_type         = "Enhanced"
  network_type     = "internet"
}

resource "alicloud_eip_address" "defaultyiRwgs" {
  address_name = var.name
}

resource "alicloud_eip_association" "defaults2MTuO" {
  instance_id   = alicloud_nat_gateway.default2iRZpC.id
  allocation_id = alicloud_eip_address.defaultyiRwgs.id
  mode          = "NAT"
  instance_type = "Nat"
}

resource "alicloud_snat_entry" "defaultAKE43g" {
  snat_ip           = alicloud_eip_address.defaultyiRwgs.ip_address
  snat_table_id     = alicloud_nat_gateway.default2iRZpC.snat_table_ids
  source_vswitch_id = alicloud_vswitch.defaultp4O7qi.id
}

resource "alicloud_cloud_firewall_nat_firewall" "default" {
  nat_gateway_id = alicloud_nat_gateway.default2iRZpC.id
  nat_route_entry_list {
    nexthop_type     = "NatGateway"
    route_table_id   = alicloud_vpc.defaultikZ0gD.route_table_id
    nexthop_id       = alicloud_nat_gateway.default2iRZpC.id
    destination_cidr = "0.0.0.0/0"
  }

  firewall_switch = "close"
  vswitch_auto    = "true"
  status          = "closed"
  region_no       = "cn-shenzhen"
  lang            = "zh"
  proxy_name      = "CFW-example"
  vswitch_id      = alicloud_snat_entry.defaultAKE43g.source_vswitch_id
  strict_mode     = "0"
  vpc_id          = alicloud_vpc.defaultikZ0gD.id
  vswitch_cidr    = "172.16.5.0/24"
}