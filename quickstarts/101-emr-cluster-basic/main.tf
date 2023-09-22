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

resource "alicloud_emr_cluster" "default" {
  configs {
    service_name = "HDFS"
    config_key   = "dfs.replication"
    config_value = "3"
    file_name    = "hdfs-site"
  }

  meta_store_conf {
    db_url       = "jdbc:mysql://${alicloud_db_instance.default.connection_string}/hmsdata?createDatabaseIfNotExist=true&characterEncoding=UTF-8"
    db_user_name = "taihao"
    db_password  = "EMRtest1234!"
  }

  zone_id = data.alicloud_emr_instance_types.default.types.0.zone_id
  modify_cluster_service_config {
    comment       = "tf-test"
    config_params = "dfs.replication"
    service_name  = "HDFS"
  }

  name         = var.name_var
  emr_ver      = data.alicloud_emr_main_versions.default.main_versions.0.emr_version
  cluster_type = "HADOOP"
}
