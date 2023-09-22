data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
}

data "alicloud_resource_manager_resource_groups" "default" {}

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

resource "alicloud_db_instance" "default" {
  engine               = "MySQL"
  engine_version       = "5.6"
  instance_type        = "rds.mysql.s2.large"
  instance_storage     = "30"
  instance_charge_type = "Postpaid"
  instance_name        = var.name
  vswitch_id           = local.vswitch_id
  monitoring_period    = "60"
}

resource "alicloud_snapshot_policy" "default" {
  name            = "${var.name}"
  repeat_weekdays = ["1", "2", "3"]
  retention_days  = -1
  time_points     = ["1", "22", "23"]
}

resource "alicloud_cs_edge_kubernetes" "default" {
  worker_vswitch_ids = [
    local.vswitch_id
  ]
  service_cidr       = var.service_cidr_var
  load_balancer_spec = var.load_balancer_spec_var
  tags = {
    Platform = "TF"
    Env      = "Pre"
  }
  install_cloud_monitor          = var.install_cloud_monitor_var
  worker_number                  = var.worker_number_var
  cluster_spec                   = var.cluster_spec_var
  worker_disk_performance_level  = var.worker_disk_performance_level_var
  worker_disk_snapshot_policy_id = alicloud_snapshot_policy.default.id
  new_nat_gateway                = var.new_nat_gateway_var
  resource_group_id              = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  worker_disk_category           = var.worker_disk_category_var
  slb_internet_enabled           = var.slb_internet_enabled_var
  is_enterprise_security_group   = var.is_enterprise_security_group_var
  rds_instances = [
    alicloud_db_instance.default.id
  ]
  node_cidr_mask              = var.node_cidr_mask_var
  pod_cidr                    = var.pod_cidr_var
  worker_instance_charge_type = var.worker_instance_charge_type_var
  deletion_protection         = var.deletion_protection_var
  password                    = var.password_var
  worker_data_disks {
    category  = "cloud_ssd"
    encrypted = "false"
    size      = "200"
  }

  worker_disk_size = var.worker_disk_size_var
  version          = var.version_var
  runtime = {

  }
  name = var.name_var
  worker_instance_types = [
    data.alicloud_instance_types.default.instance_types.0.id
  ]
}
