data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host_group" "default" {
  host_group_name = var.host_group_name_var
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
}
