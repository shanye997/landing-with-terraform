resource "alicloud_ons_instance" "default" {
  name = "tf-exampleGID-tf-exampleonsgroup7488367871615306855"
}

resource "alicloud_ons_group" "default" {
  instance_id = "${alicloud_ons_instance.default.id}"
  group_id    = "${var.group_id}"
  remark      = "alicloud_ons_group_remark"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_ons_groups" "default" {
  name_regex = "${alicloud_ons_group.default.group_id}_fake"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  group_type  = "http"
  instance_id = alicloud_ons_instance.default.id
}
