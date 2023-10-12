data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_resource_manager_resource_groups" "default" {}

data "alicloud_kms_keys" "default" {
  status = "Enabled"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_cs_managed_kubernetes" "default" {
  resource_group_id            = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  encryption_provider_key      = data.alicloud_kms_keys.default.keys.0.id
  load_balancer_spec           = "slb.s2.small"
  custom_san                   = "www.terraform.io"
  is_enterprise_security_group = var.is_enterprise_security_group_var
  control_plane_log_components = [
    "apiserver",
    "kcm",
    "scheduler"
  ]
  node_cidr_mask       = var.node_cidr_mask_var
  cluster_spec         = var.cluster_spec_var
  slb_internet_enabled = var.slb_internet_enabled_var
  maintenance_window {
    duration         = "5h"
    enable           = "true"
    maintenance_time = "05:00:00Z"
    weekly_period    = "Monday,Thursday"
  }

  control_plane_log_ttl = "30"
  worker_vswitch_ids = [
    local.vswitch_id
  ]
  new_nat_gateway     = var.new_nat_gateway_var
  timezone            = "Asia/Shanghai"
  enable_rrsa         = var.enable_rrsa_var
  proxy_mode          = var.proxy_mode_var
  version             = var.version_var
  deletion_protection = var.deletion_protection_var
  pod_cidr            = var.pod_cidr_var
  name                = var.name_var
  service_cidr        = var.service_cidr_var
  cluster_domain      = "cluster.local"
  tags = {
    Env      = "Pre"
    Platform = "TF"
  }
}
