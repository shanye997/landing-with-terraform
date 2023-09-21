resource "alicloud_mns_queue" "queue" {
  name                     = "tf-exampleMNSQueue-1131910"
  delay_seconds            = 60478
  maximum_message_size     = 12357
  message_retention_period = 256000
  visibility_timeout       = 30
  polling_wait_seconds     = 3
}

data "alicloud_mns_queues" "default" {
  name_prefix = "${alicloud_mns_queue.queue.name}-fake"
}
