data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "default" {
  name        = var.name
  description = "tf-eci-image-test"
  vpc_id      = data.alicloud_vpcs.default.vpcs.0.id
}

resource "alicloud_eip_address" "default" {
  address_name = var.name
}

resource "alicloud_eci_image_cache" "default" {
  image_cache_name  = var.name
  images            = ["registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/nginx:alpine"]
  security_group_id = alicloud_security_group.default.id
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  eip_instance_id   = alicloud_eip_address.default.id
}

data "alicloud_eci_image_caches" "default" {
  status = alicloud_eci_image_cache.default.status
  ids = [
    alicloud_eci_image_cache.default.id
  ]
  name_regex = "${alicloud_eci_image_cache.default.image_cache_name}-fake"
}
