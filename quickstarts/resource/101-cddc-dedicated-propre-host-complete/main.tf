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

data "alicloud_ecs_deployment_sets" "default" {
  name_regex = "tf-example-cddc_dedicated_propre_host"
}

resource "alicloud_ecs_deployment_set" "default" {
  count               = length(data.alicloud_ecs_deployment_sets.default.ids) > 0 ? 0 : 1
  strategy            = "Availability"
  domain              = "Default"
  granularity         = "Host"
  deployment_set_name = "tf-example-cddc_dedicated_propre_host"
  description         = "tf-example-cddc_dedicated_propre_host"
}

data "alicloud_key_pairs" "default" {
  name_regex = "tf-example-cddc_dedicated_propre_host"
}

resource "alicloud_key_pair" "default" {
  count         = length(data.alicloud_key_pairs.default.ids) > 0 ? 0 : 1
  key_pair_name = "tf-example-cddc_dedicated_propre_host"
}

data "alicloud_cddc_dedicated_host_groups" "default" {
  engine     = "MySQL"
  name_regex = "tf-example-cddc_dedicated_propre_host"
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  count                     = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? 0 : 1
  engine                    = "MySQL"
  vpc_id                    = data.alicloud_vpcs.default.ids.0
  cpu_allocation_ratio      = 101
  mem_allocation_ratio      = 50
  disk_allocation_ratio     = 200
  allocation_policy         = "Evenly"
  host_replace_policy       = "Manual"
  dedicated_host_group_desc = "tf-example-cddc_dedicated_propre_host"
  open_permission           = true
}

locals {
  alicloud_security_group_id     = length(data.alicloud_security_groups.default.ids) > 0 ? data.alicloud_security_groups.default.ids.0 : concat(alicloud_security_group.default[*].id, [""])[0]
  alicloud_ecs_deployment_set_id = length(data.alicloud_ecs_deployment_sets.default.ids) > 0 ? data.alicloud_ecs_deployment_sets.default.sets.0.deployment_set_id : concat(alicloud_ecs_deployment_set.default[*].id, [""])[0]
  alicloud_key_pair_id           = length(data.alicloud_key_pairs.default.ids) > 0 ? data.alicloud_key_pairs.default.ids.0 : concat(alicloud_key_pair.default[*].id, [""])[0]
  dedicated_host_group_id        = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.ids.0 : concat(alicloud_cddc_dedicated_host_group.default[*].id, [""])[0]
}

resource "alicloud_cddc_dedicated_propre_host" "default" {
  key_pair_name           = local.alicloud_key_pair_id
  security_group_id       = local.alicloud_security_group_id
  vpc_id                  = data.alicloud_vpcs.default.ids.0
  vswitch_id              = data.alicloud_vswitches.default.ids.0
  period                  = var.period_var
  period_type             = var.period_type_var
  password_inherit        = var.password_inherit_var
  ecs_zone_id             = "cn-hangzhou-i"
  payment_type            = "Subscription"
  ecs_deployment_set_id   = local.alicloud_ecs_deployment_set_id
  image_id                = "m-bp1d13fxs1ymbvw1dk5g"
  os_password             = var.os_password_var
  engine                  = "mysql"
  ecs_host_name           = "testTf"
  ecs_instance_name       = "testTf"
  ecs_unique_suffix       = var.ecs_unique_suffix_var
  dedicated_host_group_id = local.dedicated_host_group_id
  ecs_class_list {
    system_disk_performance_level = "PL1"
    data_disk_performance_level   = "PL1"
    disk_capacity                 = "40"
    disk_count                    = "1"
    disk_type                     = "cloud_essd"
    instance_type                 = "ecs.c6a.large"
    sys_disk_capacity             = "40"
    sys_disk_type                 = "cloud_essd"
  }

  auto_renew = var.auto_renew_var
}
