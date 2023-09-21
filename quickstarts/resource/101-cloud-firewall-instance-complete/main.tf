resource "alicloud_cloud_firewall_instance" "default" {
  cfw_account           = var.cfw_account_var
  band_width            = var.band_width_var
  renewal_status        = var.renewal_status_var
  renewal_duration_unit = var.renewal_duration_unit_var
  account_number        = var.account_number_var
  cfw_log               = var.cfw_log_var
  renewal_duration      = var.renewal_duration_var
  period                = var.period_var
  cfw_log_storage       = var.cfw_log_storage_var
  ip_number             = var.ip_number_var
  spec                  = var.spec_var
  payment_type          = "Subscription"
  modify_type           = var.modify_type_var
}
