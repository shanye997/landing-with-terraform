resource "alicloud_common_bandwidth_package" "default" {
  count                = "${var.number}"
  bandwidth            = 2
  internet_charge_type = "PayByBandwidth"
  name                 = "${var.name}"
  description          = "${var.name}_description"
}

resource "alicloud_eip_address" "default" {
  count                = "${var.number}"
  address_name         = "${var.name}"
  bandwidth            = "2"
  internet_charge_type = "PayByTraffic"
}

resource "alicloud_common_bandwidth_package_attachment" "default" {
  count                = var.number
  bandwidth_package_id = element(alicloud_common_bandwidth_package.default.*.id, count.index)
  instance_id          = element(alicloud_eip_address.default.*.id, count.index)
}
