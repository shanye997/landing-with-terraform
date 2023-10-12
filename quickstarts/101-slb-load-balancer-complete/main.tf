data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_slb_zones" "default" {
  available_slb_address_type = "vpc"
  slave_zone_id              = data.alicloud_zones.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "^default$"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_slb_zones.default.zones.0.id
}

resource "alicloud_slb_load_balancer" "default" {
  address_type                   = "intranet"
  load_balancer_spec             = var.load_balancer_spec_var
  modification_protection_reason = var.modification_protection_reason_var
  slave_zone_id                  = data.alicloud_slb_zones.default.zones.0.slave_zone_id
  vswitch_id                     = data.alicloud_vswitches.default.ids[0]
  master_zone_id                 = data.alicloud_slb_zones.default.zones.0.master_zone_id
  bandwidth                      = var.bandwidth_var
  address                        = cidrhost(data.alicloud_vswitches.default.vswitches.0.cidr_block, 1)
  tags = {
    Created = "TF"
    For     = "Test"
  }
  resource_group_id              = data.alicloud_resource_manager_resource_groups.default.ids.0
  instance_charge_type           = var.instance_charge_type_var
  load_balancer_name             = var.name
  modification_protection_status = var.modification_protection_status_var
  status                         = var.status_var
  internet_charge_type           = var.internet_charge_type_var
  delete_protection              = var.delete_protection_var
  payment_type                   = var.payment_type_var
}
