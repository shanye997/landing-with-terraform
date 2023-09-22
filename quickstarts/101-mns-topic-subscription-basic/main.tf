resource "alicloud_mns_topic" "default" {
  name                 = "${var.name}"
  maximum_message_size = 12357
  logging_enabled      = true
}

resource "alicloud_mns_topic_subscription" "default" {
  name       = "tf-exampleMNSTopicSubscriptionConfig-5156343"
  topic_name = alicloud_mns_topic.default.name
  endpoint   = "http://www.test.com/test"
}
