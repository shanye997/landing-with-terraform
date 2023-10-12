resource "alicloud_cloud_firewall_instance" "default" {
  band_width   = var.band_width_var
  payment_type = "Subscription"
  ip_number    = var.ip_number_var
  cfw_log      = var.cfw_log_var
  period       = var.period_var
  spec         = var.spec_var
}
