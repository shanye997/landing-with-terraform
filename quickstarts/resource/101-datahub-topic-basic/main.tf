resource "alicloud_datahub_project" "default" {
  name    = "${var.name}"
  comment = "project for basic."
}

resource "alicloud_datahub_topic" "default" {
  name         = "tf_example_datahub_90966"
  project_name = alicloud_datahub_project.default.name
}
