data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host" "default" {
  instance_id          = data.alicloud_bastionhost_instances.default.ids.0
  host_name            = var.name
  active_address_type  = "Private"
  host_private_address = "172.16.0.10"
  os_type              = "Linux"
  source               = "Local"
}

resource "alicloud_bastionhost_host_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  host_group_name = var.name
}

resource "alicloud_bastionhost_host_attachment" "default" {
  host_group_id = alicloud_bastionhost_host_group.default.host_group_id
  host_id       = alicloud_bastionhost_host.default.host_id
  instance_id   = alicloud_bastionhost_host_group.default.instance_id
}
