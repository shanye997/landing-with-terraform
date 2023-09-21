resource "alicloud_datahub_project" "basic" {
  name    = "${var.project_name}"
  comment = "project for basic."
}

resource "alicloud_datahub_topic" "basic" {
  project_name = "${alicloud_datahub_project.basic.name}"
  name         = "${var.topic_name}"
  record_type  = "${var.record_type}"
  shard_count  = 3
  life_cycle   = 7
  comment      = "topic for basic."
}

resource "alicloud_datahub_subscription" "default" {
  comment      = var.comment_var
  project_name = alicloud_datahub_project.basic.name
  topic_name   = alicloud_datahub_topic.basic.name
}
