data "alicloud_emr_main_versions" "default" {
  cluster_type = ["HADOOP"]
  emr_version  = "EMR-3.24.0"
}

data "alicloud_db_zones" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  instance_charge_type     = "PostPaid"
  db_instance_storage_type = "cloud_essd"
}

data "alicloud_emr_instance_types" "default" {
  destination_resource  = "InstanceType"
  cluster_type          = "HADOOP"
  zone_id               = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
  support_local_storage = false
  instance_charge_type  = "PostPaid"
  support_node_type     = ["MASTER", "CORE"]
}

data "alicloud_emr_disk_types" "data_disk" {
  destination_resource = "DataDisk"
  cluster_type         = "HADOOP"
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.default.types.0.id
  zone_id              = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
}

data "alicloud_emr_disk_types" "system_disk" {
  destination_resource = "SystemDisk"
  cluster_type         = "HADOOP"
  instance_charge_type = "PostPaid"
  instance_type        = data.alicloud_emr_instance_types.default.types.0.id
  zone_id              = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
}

data "alicloud_db_instance_classes" "default" {
  zone_id                  = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
  engine                   = "MySQL"
  engine_version           = "8.0"
  category                 = "Basic"
  db_instance_storage_type = "cloud_essd"
  instance_charge_type     = "PostPaid"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
  vswitch_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_db_instance" "default" {
  engine                   = "MySQL"
  engine_version           = "8.0"
  instance_type            = data.alicloud_db_instance_classes.default.instance_classes.0.instance_class
  instance_storage         = data.alicloud_db_instance_classes.default.instance_classes.0.storage_range.min
  zone_id                  = data.alicloud_db_zones.default.ids[length(data.alicloud_db_zones.default.ids) - 1]
  instance_charge_type     = "Postpaid"
  db_instance_storage_type = "cloud_essd"
  vswitch_id               = "${alicloud_vswitch.default.id}"
  instance_name            = "${var.name}"
  security_ips             = ["${alicloud_vswitch.default.cidr_block}"]
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
  configs {
    config_key   = "dfs.replication"
    config_value = "3"
    file_name    = "hdfs-site"
    service_name = "HDFS"
  }

  deposit_type = "HALF_MANAGED"
  host_group {
    disk_capacity     = data.alicloud_emr_disk_types.data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.data_disk.types.0.min : 160
    disk_count        = "1"
    disk_type         = data.alicloud_emr_disk_types.data_disk.types.0.value
    host_group_type   = "MASTER"
    instance_type     = data.alicloud_emr_instance_types.default.types.0.id
    node_count        = "1"
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
  }
  host_group {
    disk_count        = "4"
    disk_type         = data.alicloud_emr_disk_types.data_disk.types.0.value
    host_group_type   = "CORE"
    instance_type     = data.alicloud_emr_instance_types.default.types.0.id
    node_count        = "2"
    sys_disk_capacity = data.alicloud_emr_disk_types.system_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.system_disk.types.0.min : 160
    sys_disk_type     = data.alicloud_emr_disk_types.system_disk.types.0.value
    disk_capacity     = data.alicloud_emr_disk_types.data_disk.types.0.min > 160 ? data.alicloud_emr_disk_types.data_disk.types.0.min : 160
  }

  is_open_public_ip        = "true"
  name                     = var.name_var
  ssh_enable               = "true"
  use_local_metadb         = "false"
  cluster_type             = "HADOOP"
  high_availability_enable = "false"
  master_pwd               = "ABCtest1234!"
  modify_cluster_service_config {
    comment       = "tf-test"
    config_params = "dfs.replication"
    service_name  = "HDFS"
  }

  vswitch_id        = alicloud_vswitch.default.id
  zone_id           = data.alicloud_emr_instance_types.default.types.0.zone_id
  emr_ver           = data.alicloud_emr_main_versions.default.main_versions.0.emr_version
  security_group_id = alicloud_security_group.default.id
  meta_store_conf {
    db_password  = "EMRtest1234!"
    db_url       = "jdbc:mysql://${alicloud_db_instance.default.connection_string}/hmsdata?createDatabaseIfNotExist=true&characterEncoding=UTF-8"
    db_user_name = "taihao"
  }

  meta_store_type = "user_rds"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  user_defined_emr_ecs_role = alicloud_ram_role.default.name
  charge_type               = "PostPaid"
}
