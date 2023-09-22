resource "alicloud_log_dashboard" "default" {
  attribute      = var.attribute_var
  char_list      = var.char_list_var
  dashboard_name = "dashboard_name"
  display_name   = var.display_name_var
  project_name   = "tf-examplelogdashboard-3569260"
}
