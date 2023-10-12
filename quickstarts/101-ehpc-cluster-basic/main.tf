data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_ehpc_cluster" "default" {
  login_count           = "1"
  manager_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  os_tag                = "CentOS_7.6_64"
  login_instance_type   = data.alicloud_instance_types.default.instance_types.0.id
  cluster_name          = "${var.name}"
  compute_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  compute_count         = "1"
}
