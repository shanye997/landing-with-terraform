data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

resource "alicloud_cs_serverless_kubernetes" "default" {
  vpc_id                         = alicloud_vpc.default.id
  load_balancer_spec             = var.load_balancer_spec_var
  enable_rrsa                    = var.enable_rrsa_var
  name                           = var.name_var
  endpoint_public_access_enabled = "true"
  time_zone                      = "Asia/Shanghai"
  cluster_spec                   = "ack.pro.small"
  new_nat_gateway                = "true"
  service_discovery_types = [
    "PrivateZone"
  ]
  service_cidr        = "10.0.1.0/24"
  resource_group_id   = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  deletion_protection = var.deletion_protection_var
  tags = {
    Platform = "TF"
    Env      = "Pre"
  }
  vswitch_ids = [
    alicloud_vswitch.default.id
  ]
  logging_type = "SLS"
}
