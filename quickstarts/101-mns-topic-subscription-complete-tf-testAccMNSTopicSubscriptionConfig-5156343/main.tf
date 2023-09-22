resource "alicloud_mns_topic" "default" {
  name                 = "${var.name}"
  maximum_message_size = 12357
  logging_enabled      = true
}

resource "alicloud_mns_topic_subscription" "default" {
  notify_strategy       = var.notify_strategy_var
  topic_name            = alicloud_mns_topic.default.name
  endpoint              = "http://www.test.com/test"
  filter_tag            = "tf-test"
  name                  = "tf-exampleMNSTopicSubscriptionConfig-5156343"
  notify_content_format = "SIMPLIFIED"
}
