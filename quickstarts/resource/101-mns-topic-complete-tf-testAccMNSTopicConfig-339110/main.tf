resource "alicloud_mns_topic" "default" {
  name                 = "tf-exampleMNSTopicConfig-339110"
  logging_enabled      = var.logging_enabled_var
  maximum_message_size = var.maximum_message_size_var
}
