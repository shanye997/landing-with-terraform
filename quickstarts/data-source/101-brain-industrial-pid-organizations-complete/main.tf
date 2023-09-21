resource "alicloud_brain_industrial_pid_organization" "default" {
  pid_organization_name = "tf-example32182"
}

data "alicloud_brain_industrial_pid_organizations" "default" {
  ids = [
    alicloud_brain_industrial_pid_organization.default.id
  ]
  name_regex = "${alicloud_brain_industrial_pid_organization.default.pid_organization_name}-fake"
}
