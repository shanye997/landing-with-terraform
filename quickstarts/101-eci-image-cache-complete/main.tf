data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "group" {
  name        = "tf-exampleEciImageCache7230380"
  description = "tf-eci-image-test"
  vpc_id      = data.alicloud_vpcs.default.vpcs.0.id
}

resource "alicloud_eip_address" "default" {
  address_name = "tf-exampleEciImageCache7230380"
}

data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

resource "alicloud_eci_image_cache" "default" {
  eip_instance_id  = alicloud_eip_address.default.id
  image_cache_name = "tf-exampleeciimagecache7230380"
  images = [
    "registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/nginx:alpine"
  ]
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  security_group_id = alicloud_security_group.group.id
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
}
