resource "alicloud_message_service_topic" "default" {
  logging_enabled  = var.logging_enabled_var
  max_message_size = var.max_message_size_var
  topic_name       = "tf-exampleMessageServiceTopic-name5682"
}
