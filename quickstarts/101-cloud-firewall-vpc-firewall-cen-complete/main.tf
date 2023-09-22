data "alicloud_account" "current" {
}

data "alicloud_cen_instances" "cen_instances_ds" {
  name_regex = "^cfw-test-no-deleting"
}

data "alicloud_vpcs" "vpcs_ds" {
  name_regex = "^cfw-test-no-deleting"
}

resource "alicloud_cloud_firewall_vpc_firewall_cen" "default" {
  lang = "zh"
  local_vpc {
    network_instance_id = data.alicloud_vpcs.vpcs_ds.vpcs.0.id
  }

  member_uid        = data.alicloud_account.current.id
  status            = var.status_var
  vpc_firewall_name = var.vpc_firewall_name_var
  vpc_region        = "cn-hangzhou"
  cen_id            = data.alicloud_cen_instances.cen_instances_ds.instances.0.id
}
