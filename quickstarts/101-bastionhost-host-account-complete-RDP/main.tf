data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host" "default" {
  instance_id          = data.alicloud_bastionhost_instances.default.ids.0
  host_name            = var.name
  active_address_type  = "Private"
  host_private_address = "172.16.0.10"
  os_type              = "Linux"
  source               = "Local"
}

resource "alicloud_bastionhost_host_account" "default" {
  host_account_name = var.host_account_name_var
  host_id           = alicloud_bastionhost_host.default.host_id
  instance_id       = alicloud_bastionhost_host.default.instance_id
  password          = var.password_var
  protocol_name     = "RDP"
}
