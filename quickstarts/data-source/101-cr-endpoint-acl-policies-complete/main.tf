data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_endpoint_acl_policy" "default" {
  instance_id   = data.alicloud_cr_ee_instances.default.ids.0
  entry         = "192.168.1.0/24"
  description   = var.name
  module_name   = "Registry"
  endpoint_type = "internet"
}

data "alicloud_cr_endpoint_acl_policies" "default" {
  instance_id   = alicloud_cr_endpoint_acl_policy.default.instance_id
  endpoint_type = "internet"
  ids = [
    "${alicloud_cr_endpoint_acl_policy.default.id}_fake"
  ]
}
