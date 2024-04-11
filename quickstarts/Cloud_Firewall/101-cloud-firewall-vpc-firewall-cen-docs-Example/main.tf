# These resource primary keys should be replaced with your actual values.
resource "alicloud_cloud_firewall_vpc_firewall_cen" "default" {
  cen_id = "cen-xxx"
  local_vpc {
    network_instance_id = "vpc-xxx"
  }
  status            = "open"
  member_uid        = "14151*****827022"
  vpc_region        = "cn-hangzhou"
  vpc_firewall_name = "tf-vpc-firewall-name"
}