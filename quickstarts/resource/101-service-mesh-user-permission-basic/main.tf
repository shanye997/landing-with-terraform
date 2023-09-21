resource "alicloud_ram_user" "default" {
  name = var.name
}

resource "alicloud_service_mesh_user_permission" "default" {
  sub_account_user_id = alicloud_ram_user.default.id
}
