resource "alicloud_mns_topic" "default" {
  name                 = "${var.name}"
  maximum_message_size = 12357
  logging_enabled      = true
}

resource "alicloud_mns_topic_subscription" "default" {
  topic_name            = alicloud_mns_topic.default.name
  count                 = "5"
  endpoint              = "http://www.test.com/test${count.index}"
  filter_tag            = "tf-test"
  name                  = "tf-exampleMNSTopicSubscriptionConfig-3577128${count.index}"
  notify_content_format = "SIMPLIFIED"
}
