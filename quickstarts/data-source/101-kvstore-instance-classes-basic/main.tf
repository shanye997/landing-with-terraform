data "alicloud_zones" "resources" {
  available_resource_creation = "KVStore"
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id = data.alicloud_zones.resources.zones.0.id
}
