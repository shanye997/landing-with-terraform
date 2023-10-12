resource "alicloud_alb_health_check_template" "default" {
  health_check_connect_port  = var.health_check_connect_port_var
  health_check_host          = var.health_check_host_var
  health_check_interval      = var.health_check_interval_var
  health_check_template_name = var.health_check_template_name_var
  health_check_timeout       = var.health_check_timeout_var
  healthy_threshold          = var.healthy_threshold_var
  health_check_codes = [
    "http_3xx",
    "http_4xx"
  ]
  unhealthy_threshold       = var.unhealthy_threshold_var
  health_check_method       = var.health_check_method_var
  health_check_protocol     = var.health_check_protocol_var
  dry_run                   = var.dry_run_var
  health_check_http_version = var.health_check_http_version_var
  health_check_path         = var.health_check_path_var
}
