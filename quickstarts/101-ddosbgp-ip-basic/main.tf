resource "alicloud_eip_address" "default" {
  address_name = var.name
}

data "alicloud_ddosbgp_instances" default {}

resource "alicloud_ddosbgp_ip" "default" {
  ip          = alicloud_eip_address.default.ip_address
  instance_id = data.alicloud_ddosbgp_instances.default.ids.0
}
