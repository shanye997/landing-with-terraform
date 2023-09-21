data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
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

resource "alicloud_cs_edge_kubernetes" "default" {
  name_prefix                 = "${var.name}"
  worker_vswitch_ids          = [local.vswitch_id]
  deletion_protection         = false
  new_nat_gateway             = true
  proxy_mode                  = "ipvs"
  worker_instance_types       = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  worker_number               = 2
  password                    = "Yourpassword1234"
  pod_cidr                    = cidrsubnet("10.0.0.0/8", 8, 30)
  service_cidr                = cidrsubnet("172.16.0.0/16", 4, 1)
  install_cloud_monitor       = true
  slb_internet_enabled        = true
  worker_disk_category        = "cloud_efficiency"
  worker_instance_charge_type = "PostPaid"
  dynamic "worker_data_disks" {
    for_each = var.disks
    content {
      size     = lookup(worker_data_disks.value, "size", var.disks)
      category = lookup(worker_data_disks.value, "category", var.disks)
    }
  }
}

data "alicloud_cs_edge_kubernetes_clusters" "default" {
  enable_details = "true"
  ids = [
    alicloud_cs_edge_kubernetes.default.id
  ]
  name_regex = "${alicloud_cs_edge_kubernetes.default.name}-fake"
}
