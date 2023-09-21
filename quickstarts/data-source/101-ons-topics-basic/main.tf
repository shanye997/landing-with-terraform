resource "alicloud_ons_instance" "default" {
  instance_name = var.topic
}

data "alicloud_ons_topics" "default" {
  instance_id = alicloud_ons_instance.default.id
}
