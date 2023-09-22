data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_ecs_dedicated_host" "default" {
  action_on_maintenance = var.action_on_maintenance_var
  min_quantity          = var.min_quantity_var
  payment_type          = var.payment_type_var
  sale_cycle            = var.sale_cycle_var
  auto_placement        = var.auto_placement_var
  dedicated_host_type   = "ddh.g6"
  description           = var.description_var
  zone_id               = data.alicloud_vswitches.default.vswitches.1.zone_id
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.ids.1
  expired_time          = var.expired_time_var
  network_attributes {
    slb_udp_timeout = "70"
    udp_timeout     = "70"
  }

  dedicated_host_name = var.dedicated_host_name_var
  auto_renew          = var.auto_renew_var
  tags = {
    Created = "TF"
    For     = "DDH_Test"
  }
  auto_renew_period = var.auto_renew_period_var
}
