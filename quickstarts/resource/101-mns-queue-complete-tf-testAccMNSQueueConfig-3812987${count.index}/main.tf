resource "alicloud_mns_queue" "default" {
  name  = "tf-exampleMNSQueueConfig-3812987${count.index}"
  count = "5"
}
