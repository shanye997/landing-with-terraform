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
  source_exchange   = alicloud_amqp_exchange.default.exchange_name
  virtual_host_name = alicloud_amqp_exchange.default.virtual_host_name
  argument          = "x-match:any"
  binding_key       = alicloud_amqp_queue.default.queue_name
  binding_type      = "QUEUE"
  destination_name  = "tf-example-AmqpBindingbasic6188305894658506999"
  instance_id       = alicloud_amqp_exchange.default.instance_id
}
