resource "alicloud_rds_parameter_group" "default" {
  engine         = "mysql"
  engine_version = "5.7"
  param_detail {
    param_name  = "back_log"
    param_value = "3000"
  }
  param_detail {
    param_value = "86400"
    param_name  = "wait_timeout"
  }

  parameter_group_desc = var.parameter_group_desc_var
  parameter_group_name = var.name
}
