resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example35912"
}

resource "alicloud_brain_industrial_pid_project" "default" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.default.id
  pid_project_name    = "tf-example35912"
}

data "alicloud_brain_industrial_pid_loops" "default" {
  pid_project_id = alicloud_brain_industrial_pid_project.default.id
}
