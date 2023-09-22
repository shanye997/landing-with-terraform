data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_mse_gateway" "default" {
  slb_spec                  = var.slb_spec_var
  enterprise_security_group = var.enterprise_security_group_var
  spec                      = "MSE_GTW_2_4_200_c"
  vswitch_id                = data.alicloud_vswitches.default.ids.0
  delete_slb                = var.delete_slb_var
  internet_slb_spec         = var.internet_slb_spec_var
  vpc_id                    = data.alicloud_vpcs.default.ids.0
  backup_vswitch_id         = data.alicloud_vswitches.default.ids.1
  gateway_name              = var.name
  replica                   = "2"
}
