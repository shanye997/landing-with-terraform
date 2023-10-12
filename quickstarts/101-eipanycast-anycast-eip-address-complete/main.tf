data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_eipanycast_anycast_eip_address" "default" {
  internet_charge_type     = "PayByTraffic"
  payment_type             = "PayAsYouGo"
  resource_group_id        = data.alicloud_resource_manager_resource_groups.default.ids.0
  anycast_eip_address_name = var.anycast_eip_address_name_var
  description              = var.description_var
  service_location         = "international"
  tags = {
    Created = "TF"
    For     = "Test"
  }
  bandwidth = var.bandwidth_var
}
