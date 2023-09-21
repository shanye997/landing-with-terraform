resource "alicloud_amqp_instance" "default" {
  instance_type  = "professional"
  max_tps        = 1000
  queue_capacity = 50
  support_eip    = true
  max_eip_tps    = 128
  payment_type   = "Subscription"
  period         = 1
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = alicloud_amqp_instance.default.id
  virtual_host_name = "${var.name}"
}

resource "alicloud_amqp_queue" "default" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  queue_name        = var.name
  auto_delete_state = true
}

data "alicloud_amqp_queues" "default" {
  virtual_host_name = alicloud_amqp_queue.default.virtual_host_name
  instance_id       = alicloud_amqp_queue.default.instance_id
  ids = [
    alicloud_amqp_queue.default.queue_name
  ]
  name_regex = "fake_tf-example*"
}
