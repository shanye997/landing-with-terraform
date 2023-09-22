resource "alicloud_message_service_topic" "default" {
  topic_name = var.name
}

resource "alicloud_message_service_subscription" "default" {
  filter_tag            = "tf-test"
  notify_content_format = "JSON"
  notify_strategy       = var.notify_strategy_var
  push_type             = "http"
  subscription_name     = "tf-exampleMessageServiceSubscription-name24211"
  topic_name            = alicloud_message_service_topic.default.topic_name
  endpoint              = "http://www.test.com/test"
}
