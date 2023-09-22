data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_endpoint_acl_policy" "default" {
  entry         = "192.168.1.0/24"
  endpoint_type = "internet"
  instance_id   = data.alicloud_cr_ee_instances.default.ids.0
}
