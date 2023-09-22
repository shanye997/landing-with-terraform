data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

resource "alicloud_ecs_image_pipeline" "default" {
  base_image      = data.alicloud_images.default.ids.0
  base_image_type = "IMAGE"
}
