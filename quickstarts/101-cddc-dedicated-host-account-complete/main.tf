data "alicloud_cddc_dedicated_host_groups" "default" {}

data "alicloud_cddc_dedicated_hosts" "default" {
  dedicated_host_group_id = data.alicloud_cddc_dedicated_host_groups.default.ids.0
}

resource "alicloud_cddc_dedicated_host_account" "default" {
  account_name      = "tf_example2286"
  account_password  = var.account_password_var
  account_type      = "Normal"
  dedicated_host_id = data.alicloud_cddc_dedicated_hosts.default.hosts.0.dedicated_host_id
}
