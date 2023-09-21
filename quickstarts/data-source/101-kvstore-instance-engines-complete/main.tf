data "alicloud_zones" "resources" {
  available_resource_creation = "KVStore"
}

data "alicloud_kvstore_instance_engines" "default" {
  zone_id              = data.alicloud_zones.resources.zones.0.id
  engine               = "Redis"
  engine_version       = "5.6"
  instance_charge_type = "PostPaid"
}
