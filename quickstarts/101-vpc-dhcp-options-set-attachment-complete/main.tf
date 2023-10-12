resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vpc_dhcp_options_set" "default" {
  dhcp_options_set_name        = var.name
  dhcp_options_set_description = var.name
  domain_name                  = "example.com"
  domain_name_servers          = "100.100.2.136"
}

resource "alicloud_vpc_dhcp_options_set_attachment" "default" {
  dhcp_options_set_id = alicloud_vpc_dhcp_options_set.default.id
  vpc_id              = alicloud_vpc.default.id
}
