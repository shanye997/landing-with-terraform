resource "alicloud_ots_instance" "default" {
  count         = "5"
  description   = "tf-example35033${count.index}"
  instance_type = "Capacity"
  name          = "tf-example35033${count.index}"
}
