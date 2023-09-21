data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host" "default" {
  active_address_type  = var.active_address_type_var
  comment              = var.comment_var
  host_name            = var.host_name_var
  host_private_address = var.host_private_address_var
  host_public_address  = var.host_public_address_var
  instance_id          = data.alicloud_bastionhost_instances.default.ids.0
  os_type              = var.os_type_var
  source               = "Local"
}
