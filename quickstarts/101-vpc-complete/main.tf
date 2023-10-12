data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

resource "alicloud_vpc" "default" {
  cidr_block = var.cidr_block_var
  tags = {
    Created = "TF"
    For     = "Test"
  }
  user_cidrs = [
    "106.11.62.0/24"
  ]
  enable_ipv6          = var.enable_ipv6_var
  classic_link_enabled = var.classic_link_enabled_var
  ipv6_isp             = var.ipv6_isp_var
  dry_run              = var.dry_run_var
  vpc_name             = var.vpc_name_var
  description          = var.description_var
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.0.id
}
