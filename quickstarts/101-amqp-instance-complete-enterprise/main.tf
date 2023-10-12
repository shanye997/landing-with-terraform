resource "alicloud_amqp_instance" "default" {
  renewal_status = var.renewal_status_var
  modify_type    = var.modify_type_var
  max_eip_tps    = var.max_eip_tps_var
  period         = var.period_var
  instance_type  = "enterprise"
  queue_capacity = var.queue_capacity_var
  max_tps        = var.max_tps_var
  payment_type   = var.payment_type_var
  support_eip    = var.support_eip_var
  instance_name  = var.instance_name_var
}
