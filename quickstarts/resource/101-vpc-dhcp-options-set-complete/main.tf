data "alicloud_resource_manager_resource_groups" "default" {
}

resource "alicloud_vpc_dhcp_options_set" "default" {
  domain_name           = var.domain_name_var
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.ids.1
  dhcp_options_set_name = "${var.name}"
  domain_name_servers   = var.domain_name_servers_var
  ipv6_lease_time       = var.ipv6_lease_time_var
  lease_time            = var.lease_time_var
  tags = {
    For     = "Test"
    Created = "TF"
  }
  dhcp_options_set_description = "${var.name}"
  dry_run                      = var.dry_run_var
}
