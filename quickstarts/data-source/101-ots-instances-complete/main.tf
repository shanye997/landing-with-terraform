resource "alicloud_ots_instance" "default" {
  name          = "${var.name}"
  description   = "${var.name}"
  instance_type = "Capacity"
  tags = {
    Created = "TF-${var.name}"
    For     = "acceptance test"
  }
}

data "alicloud_ots_instances" "default" {
  name_regex = alicloud_ots_instance.default.name
  tags = {
    Created = "TF-fake"
    For     = "acceptance test fake"
  }
  ids = [
    alicloud_ots_instance.default.id
  ]
}
