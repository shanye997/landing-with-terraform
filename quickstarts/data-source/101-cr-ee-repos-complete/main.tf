resource "alicloud_cr_ee_instance" "default" {
  count          = length(data.alicloud_cr_ee_instances.default.ids) > 0 ? 0 : 1
  period         = 1
  renew_period   = 0
  payment_type   = "Subscription"
  instance_type  = "Basic"
  renewal_status = "ManualRenewal"
  instance_name  = "tf-example-basic"
}

data "alicloud_cr_ee_instances" "default" {
  name_regex = "tf-example"
}

locals {
  instance_id = length(data.alicloud_cr_ee_instances.default.ids) > 0 ? data.alicloud_cr_ee_instances.default.ids[0] : concat(alicloud_cr_ee_instance.default.*.id, [""])[0]
}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = local.instance_id
  name               = var.name
  auto_create        = true
  default_visibility = "PRIVATE"
}

resource "alicloud_cr_ee_repo" "default" {
  instance_id = local.instance_id
  namespace   = "${alicloud_cr_ee_namespace.default.name}"
  name        = "${var.name}"
  summary     = "test summary"
  repo_type   = "PRIVATE"
  detail      = "test detail"
}

data "alicloud_cr_ee_repos" "default" {
  namespace = alicloud_cr_ee_namespace.default.name
  ids = [
    "${alicloud_cr_ee_repo.default.repo_id}-fake"
  ]
  instance_id = local.instance_id
  name_regex  = "${alicloud_cr_ee_repo.default.name}-fake"
}
