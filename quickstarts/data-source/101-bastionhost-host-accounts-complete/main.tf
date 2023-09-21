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
  instance_id       = alicloud_bastionhost_host.default.instance_id
  host_account_name = var.name
  host_id           = alicloud_bastionhost_host.default.host_id
  protocol_name     = "SSH"
  password          = "YourPassword12345"
}

data "alicloud_bastionhost_host_accounts" "default" {
  name_regex        = alicloud_bastionhost_host_account.default.host_account_name
  protocol_name     = alicloud_bastionhost_host_account.default.protocol_name
  host_account_name = alicloud_bastionhost_host_account.default.host_account_name
  host_id           = alicloud_bastionhost_host_account.default.host_id
  ids = [
    alicloud_bastionhost_host_account.default.host_account_id
  ]
  instance_id = alicloud_bastionhost_host_account.default.instance_id
}
