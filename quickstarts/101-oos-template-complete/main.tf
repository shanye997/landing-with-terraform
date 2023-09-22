data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_oos_template" "default" {
  tags = {
    Created = "TF"
    For     = "acceptance Test"
  }
  template_name     = "tf-exampleOosTemplate1835081"
  version_name      = var.version_name_var
  content           = var.content_var
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
}
