data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_polardb_node_classes" "this" {
  db_type    = "MySQL"
  db_version = "8.0"
  pay_type   = "PostPaid"
  category   = "Normal"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_polardb_node_classes.this.classes.0.zone_id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_security_group" "default" {
  count  = 2
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_account" "current" {
}

resource "alicloud_kms_key" "default" {
  description            = var.name
  pending_window_in_days = 7
  status                 = "Enabled"
}

resource "alicloud_polardb_cluster" "default" {
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0
  planned_start_time = var.planned_start_time_var
  planned_end_time   = var.planned_end_time_var
  from_time_service  = var.from_time_service_var
  encryption_key     = alicloud_kms_key.default.id
  role_arn           = var.role_arn_var
  modify_type        = var.modify_type_var
  security_group_ids = alicloud_security_group.default.*.id
  deletion_lock      = var.deletion_lock_var
  sub_category       = var.sub_category_var
  vswitch_id         = data.alicloud_vswitches.default.vswitches.0.id
  db_version         = "8.0"
  collector_status   = var.collector_status_var
  encrypt_new_tables = var.encrypt_new_tables_var
  vpc_id             = data.alicloud_vpcs.default.ids.0
  db_cluster_ip_array {
    db_cluster_ip_array_name = "default"
    security_ips = [
      "10.168.1.12",
      "100.69.7.112"
    ]
  }
  db_cluster_ip_array {
    db_cluster_ip_array_name = "test_ips1"
    modify_mode              = "Cover"
    security_ips = [
      "10.168.1.14"
    ]
  }
  db_cluster_ip_array {
    db_cluster_ip_array_name = "test_ips2"
    modify_mode              = "Delete"
    security_ips = [
      "100.69.7.113"
    ]
  }

  db_node_class = data.alicloud_polardb_node_classes.this.classes.0.supported_engines.0.available_resources.0.db_node_class
  security_ips = [
    "10.168.1.12",
    "100.69.7.112"
  ]
  upgrade_type      = var.upgrade_type_var
  creation_category = "NormalMultimaster"
  pay_type          = var.pay_type_var
  maintain_time     = var.maintain_time_var
  db_type           = "MySQL"
  tde_status        = var.tde_status_var
  db_node_count     = var.db_node_count_var
  imci_switch       = var.imci_switch_var
  tags = {
    Created = "TF"
    For     = "acceptance Test"
  }
  description = var.description_var
}
