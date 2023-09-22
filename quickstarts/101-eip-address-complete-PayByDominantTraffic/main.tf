data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_eip_address" "default" {
  activity_id                        = var.activity_id_var
  payment_type                       = "PayAsYouGo"
  address_name                       = var.name
  netmode                            = "public"
  description                        = var.description_var
  resource_group_id                  = data.alicloud_resource_manager_resource_groups.default.ids.0
  internet_charge_type               = "PayByDominantTraffic"
  high_definition_monitor_log_status = "ON"
  isp                                = "BGP"
  zone                               = "ap-southeast-2a"
  bandwidth                          = var.bandwidth_var
  log_project                        = var.log_project_var
  log_store                          = var.log_store_var
}
