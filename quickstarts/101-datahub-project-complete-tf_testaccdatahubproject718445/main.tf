provider "alicloud" {
  assume_role {}
}

resource "alicloud_datahub_project" "default" {
  name = "tf_exampledatahubproject718445"
}
