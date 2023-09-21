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
  exchange_name     = var.name
  auto_delete_state = true
  exchange_type     = "FANOUT"
  internal          = false
}

data "alicloud_amqp_exchanges" "default" {
  name_regex        = "fake_tf-example*"
  virtual_host_name = alicloud_amqp_exchange.default.virtual_host_name
  ids = [
    alicloud_amqp_exchange.default.exchange_name
  ]
  instance_id = alicloud_amqp_exchange.default.instance_id
}
