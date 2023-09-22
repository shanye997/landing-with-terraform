data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_resource_manager_resource_groups" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = "${data.alicloud_vpcs.default.ids.0}"
  zone_id = "${data.alicloud_zones.default.zones.0.id}"
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
  instance_name        = "tf-examplekubernetes"
  vswitch_id           = local.vswitch_id
  monitoring_period    = "60"
}

resource "alicloud_cs_kubernetes" "default" {
  enable_ssh         = var.enable_ssh_var
  load_balancer_spec = "slb.s2.small"
  cluster_domain     = "cluster.local"
  proxy_mode         = var.proxy_mode_var
  master_vswitch_ids = [
    local.vswitch_id,
    local.vswitch_id,
    local.vswitch_id
  ]
  os_type               = "Linux"
  install_cloud_monitor = var.install_cloud_monitor_var
  password              = var.password_var
  rds_instances = [
    alicloud_db_instance.default.id
  ]
  pod_cidr             = var.pod_cidr_var
  name                 = var.name_var
  master_disk_category = var.master_disk_category_var
  new_nat_gateway      = var.new_nat_gateway_var
  deletion_protection  = var.deletion_protection_var
  master_instance_types = [
    data.alicloud_instance_types.default.instance_types.0.id,
    data.alicloud_instance_types.default.instance_types.0.id,
    data.alicloud_instance_types.default.instance_types.0.id
  ]
  platform          = "CentOS"
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  service_cidr      = var.service_cidr_var
  timezone          = "Asia/Shanghai"
  custom_san        = "www.terraform.io"
}
