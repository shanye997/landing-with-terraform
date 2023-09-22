data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

data "alicloud_zones" "default" {}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

data "alicloud_instance_types" "default" {
  image_id = data.alicloud_images.default.ids.0
}

data "alicloud_account" "default" {}

resource "alicloud_ecs_image_pipeline" "default" {
  vswitch_id       = data.alicloud_vswitches.default.ids.0
  system_disk_size = "40"
  to_region_id = [
    "cn-qingdao",
    "cn-zhangjiakou"
  ]
  build_content = "RUN yum update -y"
  image_name    = var.name
  add_account = [
    data.alicloud_account.default.id
  ]
  internet_max_bandwidth_out = "20"
  base_image_type            = "IMAGE"
  instance_type              = data.alicloud_instance_types.default.ids.0
  description                = var.name
  resource_group_id          = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  base_image                 = data.alicloud_images.default.ids.0
  delete_instance_on_failure = "true"
  name                       = var.name
  tags = {
    Created = "TF"
    Foo     = "Bar"
  }
}
