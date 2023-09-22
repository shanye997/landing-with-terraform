resource "alicloud_vpn_customer_gateway" "default" {
  ip_address = "192.104.22.228"
  name       = var.name_var
  asn        = "12345"
}
