data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  host_group_name = var.name
}

data "alicloud_bastionhost_host_groups" "default" {
  instance_id = alicloud_bastionhost_host_group.default.instance_id
}
