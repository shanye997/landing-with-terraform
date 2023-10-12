data "alicloud_emr_main_versions" "default" {
  cluster_type = ["HADOOP"]
}

data "alicloud_emr_instance_types" "local_disk" {
  destination_resource  = "InstanceType"
  cluster_type          = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  support_local_storage = true
  instance_charge_type  = "PostPaid"
  support_node_type     = ["MASTER", "CORE"]
}

data "alicloud_emr_instance_types" "cloud_disk" {
  destination_resource = "InstanceType"
  cluster_type         = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  instance_charge_type = "PostPaid"
  support_node_type    = ["MASTER"]
  zone_id              = data.alicloud_emr_instance_types.local_disk.types.0.zone_id
}

data "alicloud_emr_disk_types" "data_disk" {
  destination_resource = "DataDisk"
  cluster_type         = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.cloud_disk.types.0.id
  zone_id              = data.alicloud_emr_instance_types.cloud_disk.types.0.zone_id
}

data "alicloud_emr_disk_types" "system_disk" {
  destination_resource = "SystemDisk"
  cluster_type         = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.cloud_disk.types.0.id
  zone_id              = data.alicloud_emr_instance_types.cloud_disk.types.0.zone_id
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = "${data.alicloud_emr_instance_types.cloud_disk.types.0.zone_id}"
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

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_emr_cluster" "default" {
  is_open_public_ip = "true"
  bootstrap_action {
    arg                     = "--a=b"
    execution_fail_strategy = "FAILED_CONTINUE"
    execution_moment        = "BEFORE_INSTALL"
    execution_target        = "core_group"
    name                    = "bootstrap_test"
    path                    = "oss://emrtf/tf.sh"
  }

  vswitch_id = alicloud_vswitch.default.id
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  ssh_enable               = "true"
  security_group_id        = alicloud_security_group.default.id
  resource_group_id        = data.alicloud_resource_manager_resource_groups.default.ids.0
  emr_ver                  = data.alicloud_emr_main_versions.default.main_versions.0.emr_version
  high_availability_enable = "false"
  host_group {
    disk_capacity     = data.alicloud_emr_disk_types.data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.data_disk.types.0.min : 160
    disk_count        = "1"
    disk_type         = data.alicloud_emr_disk_types.data_disk.types.0.value
    host_group_name   = "master_group"
    instance_type     = data.alicloud_emr_instance_types.cloud_disk.types.0.id
    node_count        = "1"
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
    host_group_type   = "MASTER"
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
  }
  host_group {
    disk_capacity     = data.alicloud_emr_instance_types.local_disk.types.0.local_storage_capacity
    disk_count        = "1"
    host_group_name   = "core_group"
    instance_type     = data.alicloud_emr_instance_types.local_disk.types.0.id
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
    disk_type         = "local_disk"
    host_group_type   = "CORE"
    node_count        = "3"
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
  }

  master_pwd                = "ABCtest1234!"
  use_local_metadb          = "true"
  zone_id                   = data.alicloud_emr_instance_types.cloud_disk.types.0.zone_id
  charge_type               = "PostPaid"
  meta_store_type           = "local"
  cluster_type              = data.alicloud_emr_main_versions.default.main_versions.0.cluster_types.0
  user_defined_emr_ecs_role = alicloud_ram_role.default.name
  deposit_type              = "HALF_MANAGED"
  name                      = var.name_var
}
