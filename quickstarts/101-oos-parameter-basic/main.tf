resource "alicloud_oos_parameter" "default" {
  type           = "String"
  value          = var.value_var
  parameter_name = var.name
}
