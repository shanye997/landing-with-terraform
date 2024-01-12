resource "alicloud_cloud_firewall_vpc_firewall_cen" "default" {
  cen_id = "cen-cjok7uyb5w2b27573v"
  local_vpc {
    network_instance_id = "vpc-a2d4wzzfuumzuq6uog5w4"
  }
  status            = "open"
  member_uid        = "1415189284827022"
  vpc_region        = "ap-south-1"
  vpc_firewall_name = "tf-vpc-firewall-name"
}