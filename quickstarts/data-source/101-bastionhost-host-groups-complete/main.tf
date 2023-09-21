data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  host_group_name = var.name
}

data "alicloud_bastionhost_host_groups" "default" {
  ids = [
    "${alicloud_bastionhost_host_group.default.id}-fake"
  ]
  instance_id     = alicloud_bastionhost_host_group.default.instance_id
  name_regex      = "tf-exampleBastionhostHostGroupsTest2535fake"
  host_group_name = "tf-exampleBastionhostHostGroupsTest2535fake"
}
