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

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_kvstore_zones.default.zones.0.id
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_redis_tair_instance" "default" {
  instance_class     = var.instance_class_var
  effective_time     = var.effective_time_var
  payment_type       = "PayAsYouGo"
  vpc_id             = data.alicloud_vswitches.default.vswitches.0.vpc_id
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  zone_id            = data.alicloud_vswitches.default.vswitches.0.zone_id
  password           = var.password_var
  port               = "6379"
  engine_version     = var.engine_version_var
  secondary_zone_id  = data.alicloud_vswitches.default.vswitches.0.zone_id
  tair_instance_name = var.tair_instance_name_var
  auto_renew         = var.auto_renew_var
  shard_count        = var.shard_count_var
  vswitch_id         = data.alicloud_vswitches.default.vswitches.0.id
  instance_type      = "tair_rdb"
}
