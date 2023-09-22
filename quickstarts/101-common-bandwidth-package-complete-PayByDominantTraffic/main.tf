data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

data "alicloud_zones" "default" {}

resource "alicloud_common_bandwidth_package" "default" {
  bandwidth_package_name = var.bandwidth_package_name_var
  description            = var.description_var
  internet_charge_type   = "PayByDominantTraffic"
  isp                    = "BGP"
  ratio                  = "100"
  resource_group_id      = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  zone                   = data.alicloud_zones.default.zones.0.id
  bandwidth              = var.bandwidth_var
}
