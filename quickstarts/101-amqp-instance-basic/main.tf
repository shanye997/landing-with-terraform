resource "alicloud_amqp_instance" "default" {
  instance_type  = "professional"
  payment_type   = var.payment_type_var
  support_eip    = var.support_eip_var
  max_tps        = var.max_tps_var
  queue_capacity = var.queue_capacity_var
}
