data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  instance_id       = data.alicloud_amqp_instances.default.ids.0
  virtual_host_name = var.name
}

resource "alicloud_amqp_queue" "default" {
  auto_expire_state       = var.auto_expire_state_var
  dead_letter_routing_key = var.dead_letter_routing_key_var
  max_length              = var.max_length_var
  maximum_priority        = var.maximum_priority_var
  message_ttl             = var.message_ttl_var
  queue_name              = "tf-example-AmqpQueuebasic4495924233947507507"
  auto_delete_state       = "true"
  dead_letter_exchange    = var.dead_letter_exchange_var
  exclusive_state         = "false"
  instance_id             = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name       = alicloud_amqp_virtual_host.default.virtual_host_name
}
