resource "alicloud_ecs_image_component" "default" {
  content = "RUN yum update -y"
}
