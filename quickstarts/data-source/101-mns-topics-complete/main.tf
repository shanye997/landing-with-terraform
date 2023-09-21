resource "alicloud_mns_topic" "default" {
  name                 = "tf-exampleMNSTopicConfig-6003151"
  maximum_message_size = 12357
  logging_enabled      = true
}

data "alicloud_mns_topics" "default" {
  name_prefix = "${alicloud_mns_topic.default.name}-fake"
}
