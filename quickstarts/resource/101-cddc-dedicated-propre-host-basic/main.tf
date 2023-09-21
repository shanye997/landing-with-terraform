data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "cn-hangzhou-i"
}

data "alicloud_security_groups" "default" {
  name_regex = "tf-example-cddc_dedicated_propre_host"
}

resource "alicloud_security_group" "default" {
  count  = length(data.alicloud_security_groups.default.ids) > 0 ? 0 : 1
  vpc_id = data.alicloud_vswitches.default.vswitches.0.vpc_id
  name   = "tf-example-cddc_dedicated_propre_host"
}

locals {
  alicloud_security_group_id = length(data.alicloud_security_groups.default.ids) > 0 ? data.alicloud_security_groups.default.ids.0 : concat(alicloud_security_group.default[*].id, [""])[0]
}

resource "alicloud_cddc_dedicated_propre_host" "default" {
  vpc_id            = data.alicloud_vpcs.default.ids.0
  engine            = "mysql"
  payment_type      = "Subscription"
  vswitch_id        = data.alicloud_vswitches.default.ids.0
  security_group_id = local.alicloud_security_group_id
  ecs_zone_id       = "cn-hangzhou-i"
  ecs_class_list {
    instance_type                 = "ecs.c6a.large"
    sys_disk_capacity             = "40"
    sys_disk_type                 = "cloud_essd"
    system_disk_performance_level = "PL1"
    data_disk_performance_level   = "PL1"
    disk_capacity                 = "40"
    disk_count                    = "1"
    disk_type                     = "cloud_essd"
  }

}
