data "alicloud_amqp_instances" "default" {
  status = "SERVING"
}

resource "alicloud_amqp_virtual_host" "default" {
  virtual_host_name = var.name
  instance_id       = data.alicloud_amqp_instances.default.ids.0
}
