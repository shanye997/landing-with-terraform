resource "alicloud_nas_access_group" "default" {
  access_group_name = var.name
  access_group_type = "Vpc"
  description       = var.description_var
}
