data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default_m" {
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Master"
}

data "alicloud_instance_types" "default_w" {
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

resource "alicloud_cs_kubernetes" "default" {
  name                        = "${var.name}"
  master_vswitch_ids          = ["${local.vswitch_id}", "${local.vswitch_id}", "${local.vswitch_id}"]
  worker_vswitch_ids          = ["${local.vswitch_id}"]
  new_nat_gateway             = true
  master_instance_types       = ["${data.alicloud_instance_types.default_m.instance_types.0.id}", "${data.alicloud_instance_types.default_m.instance_types.0.id}", "${data.alicloud_instance_types.default_m.instance_types.0.id}"]
  worker_instance_types       = ["${data.alicloud_instance_types.default_w.instance_types.0.id}"]
  worker_number               = 1
  password                    = "Yourpassword1234"
  node_port_range             = "30000-32767"
  pod_cidr                    = cidrsubnet("10.0.0.0/8", 8, 33)
  service_cidr                = cidrsubnet("172.16.0.0/16", 4, 4)
  enable_ssh                  = true
  install_cloud_monitor       = true
  worker_disk_category        = "cloud_ssd"
  worker_data_disk_category   = "cloud_ssd"
  worker_data_disk_size       = 200
  master_disk_size            = 50
  worker_instance_charge_type = "PostPaid"
  worker_disk_size            = 40
  proxy_mode                  = "ipvs"
}

data "alicloud_cs_kubernetes_clusters" "default" {
  enable_details = var.enable_details_var
  ids = [
    alicloud_cs_kubernetes.default.id
  ]
  name_regex = "${alicloud_cs_kubernetes.default.name}-fake"
}
