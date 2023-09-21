data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = data.alicloud_amqp_instances.default.ids.0
  virtual_host_name = var.name
}

resource "alicloud_amqp_exchange" "default" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  auto_delete_state = true
  exchange_name     = var.name
  exchange_type     = "HEADERS"
  internal          = false
}

resource "alicloud_amqp_queue" "default" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  queue_name        = var.name
  auto_delete_state = true
}

resource "alicloud_amqp_binding" "default" {
  binding_type      = "QUEUE"
  destination_name  = "tf-example-AmqpBindingbasic8754715809893007518"
  instance_id       = alicloud_amqp_exchange.default.instance_id
  source_exchange   = alicloud_amqp_exchange.default.exchange_name
  virtual_host_name = alicloud_amqp_exchange.default.virtual_host_name
  argument          = "x-match:all"
  binding_key       = alicloud_amqp_queue.default.queue_name
}
