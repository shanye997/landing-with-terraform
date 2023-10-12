data "alicloud_cr_ee_instances" "default" {
  name_regex = "tf-example"
}

resource "alicloud_cr_ee_namespace" "default" {
  instance_id        = data.alicloud_cr_ee_instances.default.ids[0]
  name               = var.name
  auto_create        = false
  default_visibility = "PUBLIC"
}

resource "alicloud_cr_chain" "default" {
  instance_id = alicloud_cr_ee_namespace.default.instance_id
  chain_name  = var.chain_name_var
}
