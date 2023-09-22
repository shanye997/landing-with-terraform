resource "alicloud_rds_parameter_group" "default" {
  parameter_group_name = var.name
  engine               = "PostgreSQL"
  engine_version       = "11.0"
  param_detail {
    param_name  = "enable_sort"
    param_value = "off"
  }
  param_detail {
    param_name  = "geqo_seed"
    param_value = "0.1"
  }

  parameter_group_desc = var.parameter_group_desc_var
}
