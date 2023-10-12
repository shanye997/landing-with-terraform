resource "alicloud_log_dashboard" "default" {
  dashboard_name = "dashboard_name"
  project_name   = "tf-examplelogdashboard-3569260"
  char_list      = var.char_list_var
}
