resource "alicloud_ons_instance" "default" {
  name = "tf-exampleGID-tf-exampleonsgroup7488367871615306855"
}

data "alicloud_ons_groups" "default" {
  instance_id = alicloud_ons_instance.default.id
}
