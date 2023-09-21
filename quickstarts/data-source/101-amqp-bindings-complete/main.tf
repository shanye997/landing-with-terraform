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

resource "alicloud_amqp_exchange" "default" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  auto_delete_state = true
  exchange_name     = var.name
  exchange_type     = "HEADERS"
  internal          = false
}

resource "alicloud_amqp_exchange" "default2" {
  instance_id       = alicloud_amqp_virtual_host.default.instance_id
  virtual_host_name = alicloud_amqp_virtual_host.default.virtual_host_name
  auto_delete_state = true
  exchange_name     = "${var.name}-2"
  exchange_type     = "HEADERS"
  internal          = false
}

resource "alicloud_amqp_binding" "default" {
  instance_id       = alicloud_amqp_exchange.default.instance_id
  virtual_host_name = alicloud_amqp_exchange.default.virtual_host_name
  argument          = "x-match:all"
  binding_key       = alicloud_amqp_exchange.default2.exchange_name
  binding_type      = "EXCHANGE"
  destination_name  = var.name
  source_exchange   = alicloud_amqp_exchange.default.exchange_name
}

data "alicloud_amqp_bindings" "default" {
  instance_id       = alicloud_amqp_binding.default.instance_id
  virtual_host_name = "${alicloud_amqp_binding.default.virtual_host_name}-fake"
}
