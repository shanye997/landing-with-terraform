data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_host_share_key" "default" {
  pass_phrase         = var.pass_phrase_var
  private_key         = var.private_key_var
  host_share_key_name = var.host_share_key_name_var
  instance_id         = data.alicloud_bastionhost_instances.default.instances.0.id
}
