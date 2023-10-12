resource "alicloud_mns_topic" "default" {
  count = "5"
  name  = "tf-exampleMNSTopicConfig-8454772${count.index}"
}
