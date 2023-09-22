resource "alicloud_cloud_firewall_control_policy" "default" {
  application_name = "ANY"
  acl_action       = "accept"
  description      = "tf-examplecn-hangzhoucloudfirewallcontrolpolicy80137"
  destination_type = "net"
  destination      = "100.1.1.0/24"
  direction        = "out"
  proto            = "ANY"
  source           = "1.2.3.0/24"
  source_type      = "net"
}

resource "alicloud_cloud_firewall_control_policy_order" "default" {
  acl_uuid  = alicloud_cloud_firewall_control_policy.default.acl_uuid
  direction = alicloud_cloud_firewall_control_policy.default.direction
}
