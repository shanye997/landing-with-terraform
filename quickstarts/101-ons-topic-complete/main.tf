resource "alicloud_ons_instance" "default" {
  name = "tf-examplecn-hangzhouonstopicbasic8195069"
}

resource "alicloud_ons_topic" "default" {
  message_type = "1"
  remark       = alicloud_ons_topic_remark
  tags = {
    Created = "TF"
    For     = "Test"
  }
  instance_id = alicloud_ons_instance.default.id
}
