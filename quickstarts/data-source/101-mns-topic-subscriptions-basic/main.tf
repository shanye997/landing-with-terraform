resource "alicloud_mns_topic" "default" {
  name                 = "${var.name}"
  maximum_message_size = 12357
  logging_enabled      = true
}

data "alicloud_mns_topic_subscriptions" "default" {
  topic_name = alicloud_mns_topic.default.name
}
