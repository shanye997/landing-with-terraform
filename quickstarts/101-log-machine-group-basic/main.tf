resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_machine_group" "default" {
  project = alicloud_log_project.default.name
  identify_list = [
    "terraform",
    "abc1234"
  ]
  name = "tf-examplelogmachinegroupip-2299084"
}
