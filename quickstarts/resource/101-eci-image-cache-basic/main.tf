data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "group" {
  name        = "tf-exampleEciImageCache7230380"
  description = "tf-eci-image-test"
  vpc_id      = data.alicloud_vpcs.default.vpcs.0.id
}

resource "alicloud_eci_image_cache" "default" {
  image_cache_name  = "tf-exampleeciimagecache7230380"
  security_group_id = alicloud_security_group.group.id
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  images = [
    "registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/nginx:alpine"
  ]
}
