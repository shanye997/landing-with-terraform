data "alicloud_zones" "default" {}

resource "alicloud_resource_manager_resource_group" "default" {
  display_name        = "test03"
  resource_group_name = var.name
}

resource "alicloud_common_bandwidth_package" "default" {
  description            = var.description_var
  ratio                  = "100"
  force                  = var.force_var
  zone                   = data.alicloud_zones.default.zones.0.id
  deletion_protection    = var.deletion_protection_var
  bandwidth_package_name = var.bandwidth_package_name_var
  bandwidth              = var.bandwidth_var
  security_protection_types = [
    "AntiDDoS_Enhanced"
  ]
  internet_charge_type = "PayByBandwidth"
  isp                  = "BGP"
  tags = {
    Created = "TF"
    For     = "Test"
  }
  resource_group_id = alicloud_resource_manager_resource_group.default.id
}
