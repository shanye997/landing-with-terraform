resource "alicloud_ons_instance" "default" {
  name = "GID-tf-exampleonsgroupbasic7130665"
}

resource "alicloud_ons_group" "default" {
  remark = alicloud_ons_group_remark
  tags = {
    Created = "TFM"
  }
  instance_id = alicloud_ons_instance.default.id
}
