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
  count             = 3
  instance_id       = alicloud_bastionhost_host.default.instance_id
  host_account_name = "${var.name}-${count.index}"
  host_id           = alicloud_bastionhost_host.default.host_id
  protocol_name     = "SSH"
  password          = "YourPassword12345"
}

resource "alicloud_bastionhost_user" "default" {
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  mobile              = "13312345678"
  mobile_country_code = "CN"
  password            = "YourPassword-123"
  source              = "Local"
  user_name           = var.name
}

resource "alicloud_bastionhost_host_account_user_attachment" "default" {
  host_id     = alicloud_bastionhost_host_account.default[0].host_id
  instance_id = alicloud_bastionhost_host_account.default[0].instance_id
  user_id     = alicloud_bastionhost_user.default.user_id
  host_account_ids = [
    alicloud_bastionhost_host_account.default[0].host_account_id,
    alicloud_bastionhost_host_account.default[1].host_account_id,
    alicloud_bastionhost_host_account.default[2].host_account_id
  ]
}
