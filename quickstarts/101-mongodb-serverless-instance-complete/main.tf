data "alicloud_resource_manager_resource_groups" "default" {}

data "alicloud_mongodb_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_mongodb_zones.default.zones.0.id
}

resource "alicloud_vswitch" "default" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_mongodb_zones.default.zones.0.id
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids.0 : concat(alicloud_vswitch.default.*.id, [""])[0]
}

resource "alicloud_mongodb_serverless_instance" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  tags = {
    Created = "MongodbServerlessInstance1"
    For     = "TF1"
  }
  vswitch_id              = local.vswitch_id
  engine_version          = var.engine_version_var
  account_password        = var.account_password_var
  db_instance_description = "${var.name}"
  resource_group_id       = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  maintain_end_time       = var.maintain_end_time_var
  zone_id                 = data.alicloud_mongodb_zones.default.zones.0.id
  capacity_unit           = var.capacity_unit_var
  storage_engine          = var.storage_engine_var
  period_price_type       = var.period_price_type_var
  security_ip_groups {
    security_ip_group_attribute = "test3"
    security_ip_group_name      = "test3"
    security_ip_list            = "192.168.0.3"
  }

  db_instance_storage = var.db_instance_storage_var
  maintain_start_time = var.maintain_start_time_var
  period              = var.period_var
  auto_renew          = var.auto_renew_var
  engine              = var.engine_var
}
