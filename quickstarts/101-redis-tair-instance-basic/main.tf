data "alicloud_kvstore_zones" "default" {
  product_type = "Tair_rdb"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_kvstore_zones.default.zones.0.id
}

resource "alicloud_redis_tair_instance" "default" {
  instance_class = var.instance_class_var
  instance_type  = "tair_rdb"
  zone_id        = data.alicloud_vswitches.default.vswitches.0.zone_id
  vpc_id         = data.alicloud_vswitches.default.vswitches.0.vpc_id
  vswitch_id     = data.alicloud_vswitches.default.vswitches.0.id
}
