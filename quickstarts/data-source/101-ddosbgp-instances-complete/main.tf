resource "alicloud_ddosbgp_instance" "default" {
  name             = "tf_example4599780202129624657"
  bandwidth        = -1
  base_bandwidth   = 20
  normal_bandwidth = 100
  ip_count         = 100
  ip_type          = "IPv4"
  type             = "Enterprise"
}

data "alicloud_ddosbgp_instances" "default" {
  name_regex = "${alicloud_ddosbgp_instance.default.name}-fake"
  ids = [
    alicloud_ddosbgp_instance.default.id
  ]
}
