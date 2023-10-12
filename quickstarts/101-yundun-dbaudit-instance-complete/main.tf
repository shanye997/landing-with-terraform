data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_yundun_dbaudit_instance" "default" {
  plan_code         = var.plan_code_var
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.1
  tags = {
    Created = "TF"
    For     = "acceptance test"
    Updated = "TF"
  }
  vswitch_id  = data.alicloud_vswitches.default.ids.0
  description = var.name
  period      = var.period_var
}
