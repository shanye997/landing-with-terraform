data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  allocation_policy         = var.allocation_policy_var
  dedicated_host_group_desc = var.dedicated_host_group_desc_var
  engine                    = "mssql"
  host_replace_policy       = var.host_replace_policy_var
  open_permission           = "true"
  vpc_id                    = data.alicloud_vpcs.default.ids.0
}
