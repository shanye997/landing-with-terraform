data "alicloud_cen_instances" "cen_instances_ds" {
  name_regex = "^cfw-test-no-deleting"
}

data "alicloud_vpcs" "vpcs_ds" {
  name_regex = "^cfw-test-no-deleting"
}

resource "alicloud_cloud_firewall_vpc_firewall_cen" "default" {
  status     = var.status_var
  vpc_region = "cn-hangzhou"
  local_vpc {
    network_instance_id = data.alicloud_vpcs.vpcs_ds.vpcs.0.id
  }

  vpc_firewall_name = var.vpc_firewall_name_var
  cen_id            = data.alicloud_cen_instances.cen_instances_ds.instances.0.id
}
