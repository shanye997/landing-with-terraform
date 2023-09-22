resource "alicloud_ons_instance" "default" {
  name = "tf-examplecn-hangzhouonstopicbasic8195069"
}

resource "alicloud_ons_topic" "default" {
  instance_id  = alicloud_ons_instance.default.id
  message_type = "1"
}
