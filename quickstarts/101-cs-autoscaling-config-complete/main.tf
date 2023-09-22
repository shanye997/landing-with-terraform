data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
  instance_type_family = "ecs.sn1ne"
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
  name_prefix                 = "${var.name}"
  count                       = 1
  cluster_spec                = "ack.pro.small"
  worker_vswitch_ids          = [local.vswitch_id]
  new_nat_gateway             = true
  worker_instance_types       = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  node_port_range             = "30000-32767"
  password                    = "Hello1234"
  pod_cidr                    = cidrsubnet("10.0.0.0/8", 8, 36)
  service_cidr                = cidrsubnet("172.16.0.0/16", 4, 7)
  install_cloud_monitor       = true
  slb_internet_enabled        = true
  worker_disk_category        = "cloud_efficiency"
  worker_data_disk_category   = "cloud_ssd"
  worker_data_disk_size       = 200
  worker_disk_size            = 40
  worker_instance_charge_type = "PostPaid"
}

resource "alicloud_cs_autoscaling_config" "default" {
  recycle_node_deletion_enabled = var.recycle_node_deletion_enabled_var
  skip_nodes_with_system_pods   = var.skip_nodes_with_system_pods_var
  daemonset_eviction_for_nodes  = var.daemonset_eviction_for_nodes_var
  expander                      = var.expander_var
  skip_nodes_with_local_storage = var.skip_nodes_with_local_storage_var
  utilization_threshold         = var.utilization_threshold_var
  cluster_id                    = alicloud_cs_managed_kubernetes.default.0.id
  min_replica_count             = var.min_replica_count_var
  max_graceful_termination_sec  = var.max_graceful_termination_sec_var
  scale_down_enabled            = var.scale_down_enabled_var
  cool_down_duration            = var.cool_down_duration_var
  gpu_utilization_threshold     = var.gpu_utilization_threshold_var
  unneeded_duration             = var.unneeded_duration_var
  scale_up_from_zero            = var.scale_up_from_zero_var
  scan_interval                 = var.scan_interval_var
}
