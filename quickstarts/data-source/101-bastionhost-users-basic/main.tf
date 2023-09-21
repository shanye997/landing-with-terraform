data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  mobile              = "13312345678"
  mobile_country_code = "CN"
  password            = "YourPassword-123"
  source              = "Local"
  user_name           = var.name
}

data "alicloud_bastionhost_users" "default" {
  instance_id = alicloud_bastionhost_user.default.instance_id
}
