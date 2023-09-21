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
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  db_instance_name = "tf-exampleKvstoreInstance-2391911"
  security_ips     = ["10.23.12.24"]
  instance_type    = "Redis"
  engine_version   = "4.0"
  config = {
    appendonly             = "yes",
    lazyfree-lazy-eviction = "yes",
  }
  tags = {
    Created = "TF",
    For     = "update test",
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  zone_id           = data.alicloud_kvstore_zones.default.zones.0.id
  instance_class    = data.alicloud_kvstore_instance_classes.default.instance_classes.0
}

data "alicloud_kvstore_instances" "default" {
  instance_class = data.alicloud_kvstore_instance_classes.default.instance_classes.0
  name_regex     = "${alicloud_kvstore_instance.default.db_instance_name}-fake"
  payment_type   = "PostPaid"
  instance_type  = "Redis"
  tags           = alicloud_kvstore_instance.default.tags
  status         = "Normal"
  enable_details = var.enable_details_var
  engine_version = "4.0"
  vpc_id         = data.alicloud_vpcs.default.ids.0
  ids = [
    alicloud_kvstore_instance.default.id
  ]
  vswitch_id = data.alicloud_vswitches.default.ids.0
}
