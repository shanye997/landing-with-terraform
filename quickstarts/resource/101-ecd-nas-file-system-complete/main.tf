resource "alicloud_ecd_simple_office_site" "default" {
  cidr_block             = "172.16.0.0/12"
  desktop_access_type    = "Internet"
  office_site_name       = var.name
  enable_internet_access = false
}

resource "alicloud_ecd_nas_file_system" "default" {
  reset                = var.reset_var
  description          = "tf-example-ecdnasfilesystem52260"
  nas_file_system_name = "tf-example-ecdnasfilesystem52260"
  office_site_id       = alicloud_ecd_simple_office_site.default.id
}
