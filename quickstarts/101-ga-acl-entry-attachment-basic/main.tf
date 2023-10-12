resource "alicloud_ga_acl" "default" {
  acl_name           = var.name
  address_ip_version = "IPv4"
}

resource "alicloud_ga_acl_entry_attachment" "default" {
  entry  = "192.168.1.1/32"
  acl_id = alicloud_ga_acl.default.id
}
