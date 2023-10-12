resource "alicloud_rds_parameter_group" "default" {
  param_detail {
    param_name  = "back_log"
    param_value = "3000"
  }
  param_detail {
    param_name  = "wait_timeout"
    param_value = "86400"
  }

  parameter_group_name = var.name
  engine               = "mysql"
  engine_version       = "5.7"
}
