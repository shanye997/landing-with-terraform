resource "alicloud_cms_monitor_group" "default" {
  monitor_group_name = var.name
}

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
  load_balancer_name = var.name
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_slb_load_balancer" "default1" {
  load_balancer_name = "${var.name}1"
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_cms_monitor_group_instances" "default" {
  group_id = alicloud_cms_monitor_group.default.id
  instances {
    category      = "vpc"
    instance_id   = data.alicloud_vpcs.default.ids.0
    instance_name = "tf-examplevpcname"
    region_id     = "cn-hangzhou"
  }
  instances {
    category      = "slb"
    instance_id   = alicloud_slb_load_balancer.default1.id
    instance_name = "tf-examplecmsslb1"
    region_id     = "cn-hangzhou"
  }

}
