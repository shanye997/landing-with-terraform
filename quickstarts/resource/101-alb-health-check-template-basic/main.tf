resource "alicloud_alb_health_check_template" "default" {
  health_check_template_name = var.health_check_template_name_var
}
