data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  cpu_core_count       = 2
  memory_size          = 4
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

resource "alicloud_cs_managed_kubernetes" "default" {
  worker_instance_types       = [data.alicloud_instance_types.default.instance_types.0.id]
  name                        = var.name
  worker_vswitch_ids          = [local.vswitch_id]
  worker_number               = "2"
  password                    = "Test12345"
  pod_cidr                    = "172.20.0.0/16"
  service_cidr                = "172.21.0.0/20"
  worker_disk_size            = "50"
  worker_disk_category        = "cloud_ssd"
  worker_data_disk_size       = "20"
  worker_data_disk_category   = "cloud_ssd"
  worker_instance_charge_type = "PostPaid"
  slb_internet_enabled        = "true"
}

resource "alicloud_edas_k8s_cluster" "default" {
  cs_cluster_id = alicloud_cs_managed_kubernetes.default.id
  namespace_id  = "cn-hangzhou"
}
