resource "alicloud_mns_topic" "default" {
  name                 = "${var.name}"
  maximum_message_size = 12357
  logging_enabled      = true
}

resource "alicloud_mns_topic_subscription" "default" {
  topic_name            = "${alicloud_mns_topic.default.name}"
  name                  = "${var.name}"
  endpoint              = "http://www.test.com/test"
  notify_strategy       = "EXPONENTIAL_DECAY_RETRY"
  notify_content_format = "SIMPLIFIED"
}

data "alicloud_mns_topic_subscriptions" "default" {
  topic_name  = alicloud_mns_topic.default.name
  name_prefix = "${alicloud_mns_topic_subscription.default.name}-fake"
}
