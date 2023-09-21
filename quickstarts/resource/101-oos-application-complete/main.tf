data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

resource "alicloud_oos_application" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  tags = {
    Created = "Tf1"
    For     = "test"
  }
  application_name = var.application_name_var
  description      = var.description_var
}
