data "alicloud_images" "default" {
  name_regex = "^win.*fake"
  owners     = "system"
}
