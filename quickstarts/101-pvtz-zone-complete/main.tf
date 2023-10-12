data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_pvtz_zone" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  sync_status       = var.sync_status_var
  user_info {
    region_ids = [
      "cn-beijing",
      "cn-hangzhou",
      "cn-chengdu"
    ]
    user_id = data.alicloud_resource_manager_resource_groups.default.groups.0.account_id
  }

  zone_name      = "tf-example1863795.test.com"
  proxy_pattern  = var.proxy_pattern_var
  remark         = var.remark_var
  user_client_ip = var.user_client_ip_var
  lang           = var.lang_var
}
