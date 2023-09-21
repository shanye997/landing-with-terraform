data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
}

resource "alicloud_kvstore_instance" "default" {
  zone_id        = data.alicloud_kvstore_zones.default.zones[length(data.alicloud_kvstore_zones.default.ids) - 1].id
  instance_class = "redis.master.small.default"
  instance_name  = var.name
  engine_version = "4.0"
}

data "alicloud_kvstore_accounts" "default" {
  instance_id = alicloud_kvstore_instance.default.id
}
