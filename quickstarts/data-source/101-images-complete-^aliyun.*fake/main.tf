data "alicloud_account" "default" {
}

data "alicloud_images" "default" {
  name_regex     = "^aliyun.*fake"
  owners         = "system"
  image_owner_id = "${data.alicloud_account.default.id}1"
}
