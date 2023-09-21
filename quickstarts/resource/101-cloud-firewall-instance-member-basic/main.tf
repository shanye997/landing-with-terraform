resource "alicloud_resource_manager_account" "default" {
  display_name = var.name
}

resource "alicloud_cloud_firewall_instance_member" "default" {
  member_uid = alicloud_resource_manager_account.default.id
}
