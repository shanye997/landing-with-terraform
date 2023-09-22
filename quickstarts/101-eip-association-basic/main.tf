resource "alicloud_eip_address" "default" {
  address_name = "${var.name}"
}

resource "alicloud_eip_association" "default" {
  allocation_id = alicloud_eip_address.default.id
  instance_id   = "192.168.0.1"
}
