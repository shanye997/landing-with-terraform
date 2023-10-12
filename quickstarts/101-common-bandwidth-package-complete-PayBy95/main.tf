data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

data "alicloud_zones" "default" {}

resource "alicloud_common_bandwidth_package" "default" {
  bandwidth              = var.bandwidth_var
  description            = var.description_var
  isp                    = "BGP"
  ratio                  = "20"
  resource_group_id      = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  bandwidth_package_name = var.bandwidth_package_name_var
  internet_charge_type   = "PayBy95"
  security_protection_types = [
    "AntiDDoS_Enhanced"
  ]
  zone = data.alicloud_zones.default.zones.0.id
}
