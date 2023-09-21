resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_machine_group" "default" {
  name    = "tf-examplelogmachinegroupip-2299084"
  project = alicloud_log_project.default.name
  topic   = var.topic_var
  identify_list = [
    "terraform",
    "abc1234"
  ]
  identify_type = var.identify_type_var
}
