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
  instance_id = "${alicloud_cr_ee_namespace.source_ns.instance_id}"
  namespace   = "${alicloud_cr_ee_namespace.source_ns.name}"
  name        = "${var.name}"
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
  instance_id           = "${alicloud_cr_ee_namespace.source_ns.instance_id}"
  namespace_name        = "${alicloud_cr_ee_namespace.source_ns.name}"
  name                  = "${var.name}"
  target_region_id      = "${var.region}"
  target_instance_id    = "${alicloud_cr_ee_namespace.target_ns.instance_id}"
  target_namespace_name = "${alicloud_cr_ee_namespace.target_ns.name}"
  tag_filter            = ".*"
  repo_name             = "${alicloud_cr_ee_repo.source_repo.name}"
  target_repo_name      = "${alicloud_cr_ee_repo.target_repo.name}"
}

data "alicloud_cr_ee_sync_rules" "default" {
  target_instance_id = "${alicloud_cr_ee_namespace.target_ns.instance_id}-fake"
  ids = [
    "${alicloud_cr_ee_sync_rule.default.rule_id}-fake"
  ]
  instance_id    = alicloud_cr_ee_namespace.source_ns.instance_id
  name_regex     = "${alicloud_cr_ee_sync_rule.default.name}-fake"
  namespace_name = "${alicloud_cr_ee_namespace.source_ns.name}-fake"
  repo_name      = "${alicloud_cr_ee_repo.source_repo.name}-fake"
}
