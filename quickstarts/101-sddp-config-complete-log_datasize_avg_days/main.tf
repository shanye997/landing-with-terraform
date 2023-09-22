resource "alicloud_sddp_config" "default" {
  code  = "log_datasize_avg_days"
  value = var.value_var
}
