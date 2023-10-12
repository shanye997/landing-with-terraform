resource "alicloud_sddp_config" "default" {
  code  = "access_permission_exprie_max_days"
  value = var.value_var
}
