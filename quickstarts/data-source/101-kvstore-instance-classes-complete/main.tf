data "alicloud_zones" "resources" {
  available_resource_creation = "KVStore"
}

data "alicloud_kvstore_instance_classes" "default" {
  engine_version       = "5.6"
  instance_charge_type = "PostPaid"
  node_type            = "double"
  shard_number         = "1"
  series_type          = "enhanced_performance_type"
  zone_id              = data.alicloud_zones.resources.zones.0.id
  architecture         = "standard"
  edition_type         = "Community"
  engine               = "Redis"
}
