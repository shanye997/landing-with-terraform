data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

resource "alicloud_ecs_image_component" "default" {
  image_component_name = var.name
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  content              = "RUN yum update -y"
  system_type          = "Linux"
  tags = {
    Created = "tfexample0"
    For     = "Tfexample0"
  }
  component_type = "Build"
  description    = var.name
}
