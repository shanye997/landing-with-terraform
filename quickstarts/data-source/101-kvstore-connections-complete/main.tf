data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_kvstore_zones.default.zones.0.id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id        = data.alicloud_kvstore_zones.default.zones.0.id
  engine         = "Redis"
  engine_version = "4.0"
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_kvstore_instance" "default" {
  db_instance_name = "tf-exampleKvstoreConnection-2240123"
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  instance_type    = "Redis"
  engine_version   = "4.0"
  tags = {
    Created = "TF",
    For     = "update test",
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  zone_id           = data.alicloud_kvstore_zones.default.zones.0.id
  instance_class    = data.alicloud_kvstore_instance_classes.default.instance_classes.0
}

resource "alicloud_kvstore_connection" "default" {
  connection_string_prefix = "allocatetest"
  instance_id              = alicloud_kvstore_instance.default.id
  port                     = "6370"
}

data "alicloud_kvstore_connections" "default" {
  ids = [
    alicloud_kvstore_connection.default.instance_id
  ]
}
