resource "alicloud_amqp_instance" "default" {
  instance_name  = var.name
  instance_type  = "professional"
  payment_type   = "Subscription"
  renewal_status = "ManualRenewal"
  support_eip    = false
  max_tps        = 1000
  queue_capacity = 50
}

data "alicloud_amqp_instances" "default" {
  name_regex = "fake_tf-example*"
  ids = [
    alicloud_amqp_instance.default.instance_id
  ]
}
