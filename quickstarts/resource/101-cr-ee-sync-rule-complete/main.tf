data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_ee_namespace" "source_ns" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.0
  name               = "${var.name}"
  auto_create        = true
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_ee_namespace" "target_ns" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids.1
  name               = "${var.name}"
  auto_create        = true
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_ee_repo" "source_repo" {
  instance_id = alicloud_cr_ee_namespace.source_ns.instance_id
  namespace   = alicloud_cr_ee_namespace.source_ns.name
  name        = var.name
  summary     = "test"
  repo_type   = "PRIVATE"
  detail      = "test"
}

resource "alicloud_cr_ee_repo" "target_repo" {
  instance_id = "${alicloud_cr_ee_namespace.target_ns.instance_id}"
  namespace   = "${alicloud_cr_ee_namespace.target_ns.name}"
  name        = "${var.name}"
  summary     = "test"
  repo_type   = "PRIVATE"
  detail      = "test"
}

resource "alicloud_cr_ee_sync_rule" "default" {
  tag_filter            = ".*"
  target_instance_id    = alicloud_cr_ee_namespace.target_ns.instance_id
  target_namespace_name = alicloud_cr_ee_namespace.target_ns.name
  target_region_id      = "cn-hangzhou"
  depends_on = [
    alicloud_cr_ee_repo.source_repo,
    alicloud_cr_ee_repo.target_repo
  ]
  instance_id    = alicloud_cr_ee_namespace.source_ns.instance_id
  name           = var.name
  namespace_name = alicloud_cr_ee_namespace.source_ns.name
}
