data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  source      = "Ram"
  user_name   = "tf-exampleBastionhostUserRam-123456"
  instance_id = data.alicloud_bastionhost_instances.default.ids.0
}
