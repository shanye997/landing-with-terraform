data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user_group" "default" {
  user_group_name = var.user_group_name_var
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
}
