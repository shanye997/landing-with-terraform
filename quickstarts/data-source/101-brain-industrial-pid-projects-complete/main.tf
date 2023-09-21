resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example72045"
}

resource "alicloud_brain_industrial_pid_project" "default" {
  pid_organization_id = alicloud_brain_industrial_pid_organization.default.id
  pid_project_name    = "tf-example72045"
}

data "alicloud_brain_industrial_pid_projects" "default" {
  name_regex = "${alicloud_brain_industrial_pid_project.default.pid_project_name}-fake"
  ids = [
    alicloud_brain_industrial_pid_project.default.id
  ]
}
