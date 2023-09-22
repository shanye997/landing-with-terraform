data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  user_group_name = var.user_group_name_var
  comment         = var.comment_var
}
