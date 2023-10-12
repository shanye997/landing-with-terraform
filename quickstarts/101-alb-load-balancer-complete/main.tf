data "alicloud_alb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default_1" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_alb_zones.default.zones.0.id
}

resource "alicloud_vswitch" "vswitch_1" {
  count        = length(data.alicloud_vswitches.default_1.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 2)
  zone_id      = data.alicloud_alb_zones.default.zones.0.id
  vswitch_name = var.name
}

data "alicloud_vswitches" "default_2" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_alb_zones.default.zones.1.id
}

resource "alicloud_vswitch" "vswitch_2" {
  count        = length(data.alicloud_vswitches.default_2.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 4)
  zone_id      = data.alicloud_alb_zones.default.zones.1.id
  vswitch_name = var.name
}

resource "alicloud_log_project" "default" {
  name        = var.name
  description = "created by terraform"
}

resource "alicloud_log_store" "default" {
  project               = alicloud_log_project.default.name
  name                  = var.name
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

locals {
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id_1    = data.alicloud_alb_zones.default.zones.0.id
  vswitch_id_1 = length(data.alicloud_vswitches.default_1.ids) > 0 ? data.alicloud_vswitches.default_1.ids[0] : concat(alicloud_vswitch.vswitch_1.*.id, [""])[0]
  zone_id_2    = data.alicloud_alb_zones.default.zones.1.id
  vswitch_id_2 = length(data.alicloud_vswitches.default_2.ids) > 0 ? data.alicloud_vswitches.default_2.ids[0] : concat(alicloud_vswitch.vswitch_2.*.id, [""])[0]
  log_project  = alicloud_log_project.default.name
  log_store    = alicloud_log_store.default.name
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_load_balancer" "default" {
  address_type = var.address_type_var
  tags = {
    For     = "Test1"
    Created = "TF1"
  }
  address_ip_version = "Ipv4"
  load_balancer_billing_config {
    pay_type = "PayAsYouGo"
  }

  load_balancer_name = var.name
  modification_protection_config {
    reason = "TF_Test123.-"
    status = "ConsoleProtection"
  }

  zone_mappings {
    vswitch_id = local.vswitch_id_1
    zone_id    = local.zone_id_1
  }
  zone_mappings {
    vswitch_id = local.vswitch_id_2
    zone_id    = local.zone_id_2
  }

  address_allocated_mode = "Fixed"
  vpc_id                 = local.vpc_id
  access_log_config {
    log_project = local.log_project
    log_store   = local.log_store
  }

  deletion_protection_enabled = var.deletion_protection_enabled_var
  resource_group_id           = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  load_balancer_edition       = var.load_balancer_edition_var
}
