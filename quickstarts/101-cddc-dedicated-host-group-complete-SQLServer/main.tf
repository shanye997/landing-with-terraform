data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  dedicated_host_group_desc = var.dedicated_host_group_desc_var
  engine                    = "SQLServer"
  host_replace_policy       = var.host_replace_policy_var
  mem_allocation_ratio      = var.mem_allocation_ratio_var
  open_permission           = "true"
  vpc_id                    = data.alicloud_vpcs.default.ids.0
  allocation_policy         = var.allocation_policy_var
  cpu_allocation_ratio      = var.cpu_allocation_ratio_var
}
