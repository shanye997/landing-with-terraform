resource "alicloud_vod_editing_project" "default" {
  cover_url            = var.cover_url_var
  editing_project_name = "${var.name}"
  timeline             = var.timeline_var
  title                = "${var.name}"
  division             = var.division_var
}
