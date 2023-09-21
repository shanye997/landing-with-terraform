data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "source_ns" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "${var.name}"
  auto_create        = true
  default_visibility = "PRIVATE"
}

data "alicloud_cr_ee_sync_rules" "default" {
  instance_id = alicloud_cr_ee_namespace.source_ns.instance_id
}
