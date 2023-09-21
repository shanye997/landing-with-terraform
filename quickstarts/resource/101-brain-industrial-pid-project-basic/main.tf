resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example8886"
}

resource "alicloud_brain_industrial_pid_project" "default" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.default.id
  pid_project_name    = var.pid_project_name_var
}
