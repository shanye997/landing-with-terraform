variable "name" {
  default = "terraform-example"
}
resource "alicloud_ecd_simple_office_site" "default" {
  cidr_block          = "172.16.0.0/12"
  enable_admin_access = false
  desktop_access_type = "Internet"
  office_site_name    = var.name
}

resource "alicloud_ecd_nas_file_system" "example" {
  nas_file_system_name = var.name
  office_site_id       = alicloud_ecd_simple_office_site.default.id
  description          = var.name
}