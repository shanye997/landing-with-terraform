resource "alicloud_datahub_project" "default" {
  name  = "tf_exampledatahubproject315865${count.index}"
  count = "5"
}
