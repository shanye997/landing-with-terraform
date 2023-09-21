resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example71459"
}

resource "alicloud_brain_industrial_pid_project" "default" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.default.id
  pid_project_name    = "tf-example71459"
}

resource "alicloud_brain_industrial_pid_loop" "default" {
  pid_loop_desc          = var.pid_loop_desc_var
  pid_loop_is_crucial    = var.pid_loop_is_crucial_var
  pid_loop_name          = var.pid_loop_name_var
  pid_loop_type          = var.pid_loop_type_var
  pid_project_id         = alicloud_brain_industrial_pid_project.default.id
  pid_loop_configuration = var.pid_loop_configuration_var
  pid_loop_dcs_type      = "standard"
}
