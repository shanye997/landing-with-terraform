data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  mobile              = "13312345678"
  mobile_country_code = "CN"
  password            = "YourPassword-123"
  source              = "Local"
  user_name           = var.name
}

resource "alicloud_bastionhost_user_group" "default" {
  instance_id     = data.alicloud_bastionhost_instances.default.ids.0
  user_group_name = var.name
}

resource "alicloud_bastionhost_user_attachment" "default" {
  user_id       = alicloud_bastionhost_user.default.user_id
  instance_id   = alicloud_bastionhost_user_group.default.instance_id
  user_group_id = alicloud_bastionhost_user_group.default.user_group_id
}
