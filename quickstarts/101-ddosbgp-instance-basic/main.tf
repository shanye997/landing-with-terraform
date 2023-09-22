resource "alicloud_ddosbgp_instance" "default" {
  bandwidth        = "-1"
  ip_type          = "IPv4"
  normal_bandwidth = "100"
  ip_count         = "100"
}
