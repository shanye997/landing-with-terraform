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

data "alicloud_cr_ee_repos" "default" {
  instance_id = local.instance_id
}
