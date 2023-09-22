data "alicloud_emr_main_versions" "default" {
  cluster_type = ["HADOOP"]
}

data "alicloud_emr_instance_types" "default" {
  destination_resource  = "InstanceType"
  cluster_type          = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  support_local_storage = false
  instance_charge_type  = "PostPaid"
  support_node_type     = ["MASTER", "CORE"]
}

data "alicloud_emr_instance_types" "gateway" {
  destination_resource  = "InstanceType"
  cluster_type          = "GATEWAY"
  support_local_storage = false
  instance_charge_type  = "PostPaid"
  support_node_type     = ["GATEWAY"]
}

data "alicloud_emr_disk_types" "data_disk" {
  destination_resource = "DataDisk"
  cluster_type         = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.default.types.0.id
  zone_id              = data.alicloud_emr_instance_types.default.types.0.zone_id
}

data "alicloud_emr_disk_types" "gateway_data_disk" {
  destination_resource = "DataDisk"
  cluster_type         = "GATEWAY"
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.gateway.types.0.id
  zone_id              = data.alicloud_emr_instance_types.gateway.types.0.zone_id
}

data "alicloud_emr_disk_types" "system_disk" {
  destination_resource = "SystemDisk"
  cluster_type         = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.default.types.0.id
  zone_id              = data.alicloud_emr_instance_types.default.types.0.zone_id
}

data "alicloud_emr_disk_types" "gateway_system_disk" {
  destination_resource = "SystemDisk"
  cluster_type         = "GATEWAY"
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.gateway.types.0.id
  zone_id              = data.alicloud_emr_instance_types.gateway.types.0.zone_id
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = "${data.alicloud_emr_instance_types.default.types.0.zone_id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<EOF
    {
        "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Effect": "Allow",
            "Principal": {
            "Service": [
                "emr.aliyuncs.com", 
                "ecs.aliyuncs.com"
            ]
            }
        }
        ],
        "Version": "1"
    }
    EOF
  description = "this is a role test."
  force       = true
}

resource "alicloud_emr_cluster" "default" {
  name = "${var.name}"

  emr_ver = data.alicloud_emr_main_versions.default.main_versions.0.emr_version

  cluster_type = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0

  host_group {
    host_group_name   = "master_group"
    host_group_type   = "MASTER"
    node_count        = "2"
    instance_type     = data.alicloud_emr_instance_types.default.types.0.id
    disk_type         = data.alicloud_emr_disk_types.data_disk.types.0.value
    disk_capacity     = data.alicloud_emr_disk_types.data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.data_disk.types.0.min : 160
    disk_count        = "1"
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
  }

  host_group {
    host_group_name   = "core_group"
    host_group_type   = "CORE"
    node_count        = "2"
    instance_type     = data.alicloud_emr_instance_types.default.types.0.id
    disk_type         = data.alicloud_emr_disk_types.data_disk.types.0.value
    disk_capacity     = data.alicloud_emr_disk_types.data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.data_disk.types.0.min : 160
    disk_count        = "4"
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
  }

  high_availability_enable  = true
  meta_store_type           = "local"
  zone_id                   = data.alicloud_emr_instance_types.default.types.0.zone_id
  security_group_id         = alicloud_security_group.default.id
  is_open_public_ip         = true
  charge_type               = "PostPaid"
  vswitch_id                = alicloud_vswitch.default.id
  user_defined_emr_ecs_role = alicloud_ram_role.default.name
  ssh_enable                = true
  master_pwd                = "ABCtest1234!"
}

resource "alicloud_emr_cluster" "default_gateway" {
  master_pwd                = "ABCtest1234!"
  meta_store_type           = "local"
  security_group_id         = alicloud_security_group.default.id
  ssh_enable                = "true"
  user_defined_emr_ecs_role = alicloud_ram_role.default.name
  charge_type               = "PostPaid"
  cluster_type              = "GATEWAY"
  host_group {
    disk_type         = data.alicloud_emr_disk_types.gateway_data_disk.types.0.value
    host_group_type   = "GATEWAY"
    instance_type     = data.alicloud_emr_instance_types.gateway.types.0.id
    node_count        = "1"
    sys_disk_capacity = data.alicloud_emr_disk_types.gateway_system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.gateway_system_disk.types.0.min : 160
    sys_disk_type     = data.alicloud_emr_disk_types.gateway_system_disk.types.0.value
    disk_capacity     = data.alicloud_emr_disk_types.gateway_data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.gateway_data_disk.types.0.min : 160
    disk_count        = "1"
  }

  is_open_public_ip  = "true"
  use_local_metadb   = "true"
  name               = var.name_var
  related_cluster_id = alicloud_emr_cluster.default.id
  vswitch_id         = alicloud_vswitch.default.id
  zone_id            = data.alicloud_emr_instance_types.default.types.0.zone_id
  emr_ver            = data.alicloud_emr_main_versions.default.main_versions.0.emr_version
}
