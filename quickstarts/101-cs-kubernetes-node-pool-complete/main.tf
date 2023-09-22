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
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_zones.default.zones.0.id
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_key_pair" "default" {
  key_name = var.name
}

resource "alicloud_ecs_deployment_set" "default" {
  strategy            = "Availability"
  domain              = "Default"
  granularity         = "Host"
  deployment_set_name = var.name
}

resource "alicloud_cs_managed_kubernetes" "default" {
  name                        = "${var.name}"
  count                       = 1
  cluster_spec                = "ack.pro.small"
  worker_vswitch_ids          = [local.vswitch_id]
  new_nat_gateway             = true
  worker_instance_types       = ["${data.alicloud_instance_types.default.instance_types.0.id}"]
  node_port_range             = "30000-32767"
  password                    = "Hello1234"
  pod_cidr                    = cidrsubnet("10.0.0.0/8", 8, 40)
  service_cidr                = cidrsubnet("172.17.0.0/16", 4, 2)
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

data "alicloud_kms_keys" "default" {
  status = "Enabled"
}

resource "alicloud_security_group" "group" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_security_group" "group1" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_cs_kubernetes_node_pool" "default" {
  kubelet_configuration {
    registry_pull_qps     = "0"
    serialize_image_pulls = "false"
    cpu_manager_policy    = "none"
    event_burst           = "0"
    event_record_qps      = "0"
    registry_burst        = "0"
  }

  vswitch_ids = [
    local.vswitch_id
  ]
  instance_types = [
    data.alicloud_instance_types.default.instance_types.0.id
  ]
  system_disk_size = var.system_disk_size_var
  security_group_ids = [
    alicloud_security_group.group.id,
    alicloud_security_group.group1.id
  ]
  system_disk_encrypt_algorithm = var.system_disk_encrypt_algorithm_var
  system_disk_kms_key           = data.alicloud_kms_keys.default.ids.0
  install_cloud_monitor         = var.install_cloud_monitor_var
  management {
    surge           = "0"
    auto_repair     = "true"
    auto_upgrade    = "true"
    max_unavailable = "0"
  }

  system_disk_category = var.system_disk_category_var
  image_type           = var.image_type_var
  name                 = var.name_var
  tags = {
    Foo     = "Bar"
    Created = "TF"
  }
  rolling_policy {
    max_parallelism = "1"
  }

  system_disk_encrypted = var.system_disk_encrypted_var
  spot_strategy         = var.spot_strategy_var
  cluster_id            = alicloud_cs_managed_kubernetes.default.0.id
  cis_enabled           = var.cis_enabled_var
  deployment_set_id     = alicloud_ecs_deployment_set.default.id
  scaling_config {
    type                     = "cpu"
    eip_bandwidth            = "5"
    eip_internet_charge_type = "PayByBandwidth"
    is_bond_eip              = "false"
    max_size                 = "20"
    min_size                 = "1"
  }

  scaling_policy = var.scaling_policy_var
  desired_size   = var.desired_size_var
  cpu_policy     = var.cpu_policy_var
  key_name       = alicloud_key_pair.default.key_name
  data_disks {
    size     = "100"
    category = "cloud_ssd"
  }

}
