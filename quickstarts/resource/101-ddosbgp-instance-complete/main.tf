resource "alicloud_ddosbgp_instance" "default" {
  normal_bandwidth = "100"
  bandwidth        = "-1"
  base_bandwidth   = "20"
  ip_count         = "100"
  ip_type          = "IPv4"
  name             = var.name_var
}
