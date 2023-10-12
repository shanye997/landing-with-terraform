data "alicloud_resource_manager_accounts" "default" {}

resource "alicloud_resource_manager_resource_share" "default" {
  resource_share_name = var.name
}

resource "alicloud_resource_manager_shared_target" "default" {
  resource_share_id = alicloud_resource_manager_resource_share.default.id
  target_id         = data.alicloud_resource_manager_accounts.default.ids.0
}
