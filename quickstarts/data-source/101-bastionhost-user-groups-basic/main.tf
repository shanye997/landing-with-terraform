data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  user_group_name = var.name
}

data "alicloud_bastionhost_user_groups" "default" {
  instance_id = alicloud_bastionhost_user_group.default.instance_id
}
