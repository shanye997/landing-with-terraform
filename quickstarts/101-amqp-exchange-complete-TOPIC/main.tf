data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = data.alicloud_amqp_instances.default.ids.0
  virtual_host_name = var.name
}

resource "alicloud_amqp_exchange" "default" {
  exchange_name      = "tf-example-AmqpExchangebasic7676255217131002427"
  exchange_type      = "TOPIC"
  instance_id        = alicloud_amqp_virtual_host.default.instance_id
  internal           = var.internal_var
  virtual_host_name  = alicloud_amqp_virtual_host.default.virtual_host_name
  alternate_exchange = var.alternate_exchange_var
  auto_delete_state  = "true"
}
