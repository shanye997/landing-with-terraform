resource "alicloud_ons_instance" "default" {
  name   = "${var.name}"
  remark = "default-remark"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_ons_instances" "default" {
  tags = {
    Created = "TF-fake"
    For     = "acceptance test"
  }
  ids = [
    "${alicloud_ons_instance.default.id}_fake"
  ]
  name_regex = alicloud_ons_instance.default.name
  status     = "0"
}
