resource "alicloud_slb_acl" "default" {
  name       = var.name
  ip_version = "ipv4"
}

resource "alicloud_slb_acl_entry_attachment" "default" {
  entry  = "10.10.10.0/24"
  acl_id = alicloud_slb_acl.default.id
}
