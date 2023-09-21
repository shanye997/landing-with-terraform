data "alicloud_cr_ee_instances" "default" {}

resource "alicloud_cr_endpoint_acl_policy" "default" {
  description   = "tf-examplecn-hangzhoucrEndpointaclpolicy48029"
  endpoint_type = "internet"
  entry         = "192.168.1.0/24"
  instance_id   = data.alicloud_cr_ee_instances.default.ids.0
  module_name   = "Registry"
}
