data "alicloud_images" "default" {
  name_regex  = "^win.*-fake"
  owners      = "system"
  most_recent = "true"
  status      = var.status_var
}
