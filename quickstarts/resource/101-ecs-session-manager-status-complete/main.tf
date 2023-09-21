resource "alicloud_ecs_session_manager_status" "default" {
  session_manager_status_name = "sessionManagerStatus"
  status                      = var.status_var
}
