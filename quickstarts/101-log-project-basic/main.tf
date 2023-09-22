provider "alicloud" {
  assume_role {}
}

resource "alicloud_log_project" "default" {
  name = "tf-examplecn-hangzhoulogproject-3113"
}
