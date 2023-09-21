resource "alicloud_oos_secret_parameter" "default" {
  value                 = var.value_var
  secret_parameter_name = var.name
}
