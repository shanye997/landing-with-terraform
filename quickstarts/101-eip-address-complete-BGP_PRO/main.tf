resource "alicloud_eip_address" "default" {
  address_name  = var.name
  bandwidth     = var.bandwidth_var
  description   = var.description_var
  isp           = "BGP_PRO"
  auto_pay      = var.auto_pay_var
  payment_type  = "Subscription"
  period        = var.period_var
  pricing_cycle = var.pricing_cycle_var
}
