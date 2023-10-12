data "alicloud_kvstore_zones" "default" {
  instance_charge_type = "PostPaid"
  engine               = "redis"
  product_type         = "Local"
}

data "alicloud_kvstore_instance_classes" "default" {
  zone_id        = data.alicloud_kvstore_zones.default.ids.0
  engine         = "Redis"
  engine_version = "4.0"
  product_type   = "Local"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_kvstore_zones.default.ids.0
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_kvstore_zones.default.ids.0
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_kvstore_instance" "default" {
  instance_class   = data.alicloud_kvstore_instance_classes.default.instance_classes.0
  db_instance_name = var.name
  vswitch_id       = local.vswitch_id
  security_ips     = ["10.0.0.1"]
  instance_type    = "Redis"
  engine_version   = "4.0"
}

resource "alicloud_kvstore_audit_log_config" "default" {
  instance_id = alicloud_kvstore_instance.default.id
}
