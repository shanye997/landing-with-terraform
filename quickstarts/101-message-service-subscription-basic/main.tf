resource "alicloud_message_service_topic" "default" {
  topic_name = var.name
}

resource "alicloud_message_service_subscription" "default" {
  subscription_name = "tf-exampleMessageServiceSubscription-name24211"
  topic_name        = alicloud_message_service_topic.default.topic_name
  endpoint          = "http://www.test.com/test"
  push_type         = "http"
}
