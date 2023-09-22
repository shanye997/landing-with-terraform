resource "alicloud_datahub_project" "default" {
  name    = "${var.name}"
  comment = "project for basic."
}

resource "alicloud_datahub_topic" "default" {
  count        = "5"
  name         = "tf_example_datahub_373438${count.index}"
  project_name = alicloud_datahub_project.default.name
  record_schema = {

  }
}
