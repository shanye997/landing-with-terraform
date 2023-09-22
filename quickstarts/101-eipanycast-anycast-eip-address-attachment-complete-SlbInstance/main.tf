data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_slb_zones" "default" {
  available_slb_address_type = "vpc"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_slb_zones.default.zones.0.id
}

resource "alicloud_slb_load_balancer" "default" {
  address_type       = "intranet"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
  load_balancer_name = var.name
  load_balancer_spec = "slb.s1.small"
  master_zone_id     = "${data.alicloud_slb_zones.default.zones.0.id}"
}

resource "alicloud_eipanycast_anycast_eip_address" "default" {
  anycast_eip_address_name = "${var.name}"
  service_location         = "ChineseMainland"
}

resource "alicloud_eipanycast_anycast_eip_address_attachment" "default" {
  anycast_id              = alicloud_eipanycast_anycast_eip_address.default.id
  bind_instance_id        = alicloud_slb_load_balancer.default.id
  bind_instance_region_id = "cn-hangzhou"
  bind_instance_type      = "SlbInstance"
}
