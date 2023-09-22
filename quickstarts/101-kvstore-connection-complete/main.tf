data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  zone_id = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 1].id
  vpc_id  = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_kvstore_instance" "default" {
  db_instance_name = "tf-exampleKvstoreConnection6030565"
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  instance_type    = "Redis"
  engine_version   = "4.0"
  tags = {
    Created = "TF",
    For     = "update test",
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  zone_id           = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 1].id
  instance_class    = "redis.master.large.default"
}

resource "alicloud_kvstore_connection" "default" {
  connection_string_prefix = var.connection_string_prefix_var
  instance_id              = alicloud_kvstore_instance.default.id
  port                     = var.port_var
}
