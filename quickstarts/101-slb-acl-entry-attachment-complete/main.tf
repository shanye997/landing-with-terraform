resource "alicloud_slb_acl" "default" {
  name       = var.name
  ip_version = "ipv4"
}

resource "alicloud_slb_acl_entry_attachment" "default" {
  acl_id  = alicloud_slb_acl.default.id
  comment = "tf-exampleSlbAclEntryAttachment54967"
  entry   = "10.10.10.0/24"
}
