data "alicloud_dms_enterprise_instances" "dms_enterprise_instances_ds" {
  instance_type = "mysql"
  search_key    = "tf-test-no-deleting"
}

data "alicloud_dms_enterprise_databases" "test4" {
  name_regex  = "test4"
  instance_id = data.alicloud_dms_enterprise_instances.dms_enterprise_instances_ds.instances.0.instance_id
}

data "alicloud_dms_enterprise_databases" "test5" {
  name_regex  = "test5"
  instance_id = data.alicloud_dms_enterprise_instances.dms_enterprise_instances_ds.instances.0.instance_id
}

resource "alicloud_dms_enterprise_logic_database" "default" {
  alias = "${var.name}"
  database_ids = [
    data.alicloud_dms_enterprise_databases.test4.databases.0.id,
    data.alicloud_dms_enterprise_databases.test5.databases.0.id
  ]
}
