resource "alicloud_ons_instance" "default" {
  instance_name = var.topic
}

resource "alicloud_ons_topic" "default" {
  instance_id  = "${alicloud_ons_instance.default.id}"
  topic_name   = "${var.topic}"
  message_type = "0"
  remark       = "alicloud_ons_topic_remark"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

data "alicloud_ons_topics" "default" {
  name_regex = "fake_tf-example*"
  ids = [
    alicloud_ons_topic.default.topic
  ]
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  instance_id = alicloud_ons_instance.default.id
}
