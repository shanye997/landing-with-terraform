resource "alicloud_mns_queue" "default" {
  maximum_message_size     = var.maximum_message_size_var
  message_retention_period = var.message_retention_period_var
  name                     = "tf-exampleMNSQueueConfig-4654439"
  polling_wait_seconds     = var.polling_wait_seconds_var
  visibility_timeout       = var.visibility_timeout_var
  delay_seconds            = var.delay_seconds_var
}
