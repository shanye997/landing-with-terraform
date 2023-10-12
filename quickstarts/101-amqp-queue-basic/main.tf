data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = data.alicloud_amqp_instances.default.ids.0
  virtual_host_name = var.name
}

resource "alicloud_amqp_queue" "default" {
  queue_name        = "tf-example-AmqpQueuebasic4495924233947507507"
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
}
