resource "alicloud_message_service_queue" "default" {
  queue_name               = "tf-exampleMessageServiceQueue-name48426"
  visibility_timeout       = var.visibility_timeout_var
  delay_seconds            = var.delay_seconds_var
  logging_enabled          = var.logging_enabled_var
  maximum_message_size     = var.maximum_message_size_var
  message_retention_period = var.message_retention_period_var
  polling_wait_seconds     = var.polling_wait_seconds_var
}
