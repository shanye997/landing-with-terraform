data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host" "default" {
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  os_type             = var.os_type_var
  source              = "Local"
  active_address_type = var.active_address_type_var
  host_name           = var.host_name_var
}
