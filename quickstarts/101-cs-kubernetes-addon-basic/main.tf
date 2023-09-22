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

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_cs_managed_kubernetes" "default" {
  name                        = "${var.name}"
  count                       = 1
  cluster_spec                = "ack.pro.small"
  worker_vswitch_ids          = [local.vswitch_id]
  new_nat_gateway             = false
  worker_instance_types       = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  node_port_range             = "30000-32767"
  password                    = "Hello1234"
  pod_cidr                    = cidrsubnet("10.0.0.0/8", 8, 37)
  service_cidr                = cidrsubnet("172.16.0.0/16", 4, 8)
  install_cloud_monitor       = true
  slb_internet_enabled        = true
  worker_disk_category        = "cloud_efficiency"
  worker_data_disk_category   = "cloud_ssd"
  worker_data_disk_size       = 200
  worker_disk_size            = 40
  worker_instance_charge_type = "PostPaid"

  maintenance_window {
    enable           = true
    maintenance_time = "03:00:00Z"
    duration         = "3h"
    weekly_period    = "Thursday"
  }
}

resource "alicloud_cs_kubernetes_addon" "default" {
  cluster_id = alicloud_cs_managed_kubernetes.default.0.id
  name       = "ack-node-problem-detector"
  version    = var.version_var
}
