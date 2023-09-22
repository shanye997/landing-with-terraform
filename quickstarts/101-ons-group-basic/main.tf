resource "alicloud_ons_instance" "default" {
  name = "GID-tf-exampleonsgroupbasic7130665"
}

resource "alicloud_ons_group" "default" {
  instance_id = alicloud_ons_instance.default.id
}
