data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_oos_application" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  application_name  = var.name
  description       = var.name
  tags = {
    Created = "TF"
  }
}

resource "alicloud_oos_application_group" "default" {
  application_name       = alicloud_oos_application.default.id
  deploy_region_id       = "cn-hangzhou"
  description            = var.name
  import_tag_key         = var.name
  import_tag_value       = var.name
  application_group_name = var.name
}
