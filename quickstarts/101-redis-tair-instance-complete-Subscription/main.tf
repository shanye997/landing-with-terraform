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
  tair_instance_name = var.tair_instance_name_var
  payment_type       = "Subscription"
  zone_id            = data.alicloud_vswitches.default.vswitches.0.zone_id
  auto_renew         = var.auto_renew_var
  vpc_id             = data.alicloud_vswitches.default.vswitches.0.vpc_id
  instance_type      = "tair_rdb"
  secondary_zone_id  = data.alicloud_vswitches.default.vswitches.0.zone_id
  auto_renew_period  = var.auto_renew_period_var
  password           = var.password_var
  port               = "6379"
  vswitch_id         = data.alicloud_vswitches.default.vswitches.0.id
  effective_time     = var.effective_time_var
  period             = var.period_var
  engine_version     = var.engine_version_var
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  shard_count        = var.shard_count_var
}
