resource "alicloud_threat_detection_baseline_strategy" "default" {
  end_time               = var.end_time_var
  risk_sub_type_name     = var.risk_sub_type_name_var
  start_time             = var.start_time_var
  target_type            = var.target_type_var
  baseline_strategy_name = var.name
  custom_type            = var.custom_type_var
  cycle_days             = var.cycle_days_var
}
