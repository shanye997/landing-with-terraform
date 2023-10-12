data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = data.alicloud_amqp_instances.default.ids.0
  virtual_host_name = var.name
}

resource "alicloud_amqp_exchange" "default" {
  internal           = var.internal_var
  virtual_host_name  = alicloud_amqp_virtual_host.default.virtual_host_name
  alternate_exchange = var.alternate_exchange_var
  auto_delete_state  = "true"
  exchange_name      = "tf-example-AmqpExchangebasic4355298057048040199"
  exchange_type      = "FANOUT"
  instance_id        = alicloud_amqp_virtual_host.default.instance_id
}
