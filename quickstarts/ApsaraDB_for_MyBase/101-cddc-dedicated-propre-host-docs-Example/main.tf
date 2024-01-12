variable "name" {
  default = "terraform-example"
}

provider "alicloud" {
  region = "cn-hangzhou"
}

data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.g6e"
  network_type         = "Vpc"
}

data "alicloud_images" "default" {
  name_regex = "^aliyun_3_x64_20G_scc*"
  owners     = "system"
}

data "alicloud_instance_types" "essd" {
  cpu_core_count       = 2
  memory_size          = 4
  system_disk_category = "cloud_essd"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = "cn-hangzhou-i"
}

data "alicloud_security_groups" "default" {
  name_regex = "tf-exampleacc-cddc-dedicated_propre_host"
}

resource "alicloud_security_group" "default" {
  count  = length(data.alicloud_security_groups.default.ids) > 0 ? 0 : 1
  vpc_id = data.alicloud_vswitches.default.vswitches.0.vpc_id
  name   = "tf-exampleacc-cddc-dedicated_propre_host"
}

data "alicloud_ecs_deployment_sets" "default" {
  name_regex = "tf-exampleacc-cddc-dedicated_propre_host"
}

resource "alicloud_ecs_deployment_set" "default" {
  count               = length(data.alicloud_ecs_deployment_sets.default.ids) > 0 ? 0 : 1
  strategy            = "Availability"
  domain              = "Default"
  granularity         = "Host"
  deployment_set_name = "tf-exampleacc-cddc-dedicated_propre_host"
  description         = "tf-exampleacc-cddc-dedicated_propre_host"
}

data "alicloud_key_pairs" "default" {
  name_regex = "tf-exampleacc-cddc-dedicated_propre_host"
}

resource "alicloud_key_pair" "default" {
  count         = length(data.alicloud_key_pairs.default.ids) > 0 ? 0 : 1
  key_pair_name = "tf-exampleacc-cddc-dedicated_propre_host"
}

data "alicloud_cddc_dedicated_host_groups" "default" {
  engine     = "MySQL"
  name_regex = "tf-exampleacc-cddc-dedicated_propre_host"
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
  dedicated_host_group_desc = "tf-exampleacc-cddc-dedicated_propre_host"
  open_permission           = true
}

locals {
  alicloud_security_group_id     = length(data.alicloud_security_groups.default.ids) > 0 ? data.alicloud_security_groups.default.ids.0 : concat(alicloud_security_group.default[*].id, [""])[0]
  alicloud_ecs_deployment_set_id = length(data.alicloud_ecs_deployment_sets.default.ids) > 0 ? data.alicloud_ecs_deployment_sets.default.sets.0.deployment_set_id : concat(alicloud_ecs_deployment_set.default[*].id, [""])[0]
  alicloud_key_pair_id           = length(data.alicloud_key_pairs.default.ids) > 0 ? data.alicloud_key_pairs.default.ids.0 : concat(alicloud_key_pair.default[*].id, [""])[0]
  dedicated_host_group_id        = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.ids.0 : concat(alicloud_cddc_dedicated_host_group.default[*].id, [""])[0]
}

resource "alicloud_cddc_dedicated_propre_host" "default" {
  vswitch_id              = data.alicloud_vswitches.default.ids.0
  ecs_instance_name       = "exampleTf"
  ecs_deployment_set_id   = local.alicloud_ecs_deployment_set_id
  auto_renew              = "false"
  security_group_id       = local.alicloud_security_group_id
  dedicated_host_group_id = local.dedicated_host_group_id
  ecs_host_name           = "exampleTf"
  vpc_id                  = data.alicloud_vpcs.default.ids.0
  ecs_unique_suffix       = "false"
  password_inherit        = "false"
  engine                  = "mysql"
  period                  = "1"
  os_password             = "YourPassword123!"
  ecs_zone_id             = "cn-hangzhou-i"
  ecs_class_list {
    disk_type                     = "cloud_essd"
    sys_disk_type                 = "cloud_essd"
    disk_count                    = "1"
    system_disk_performance_level = "PL1"
    data_disk_performance_level   = "PL1"
    disk_capacity                 = "40"
    instance_type                 = "ecs.c6a.large"
    sys_disk_capacity             = "40"
  }

  payment_type = "Subscription"
  image_id     = "m-bp1d13fxs1ymbvw1dk5g"
  period_type  = "Monthly"
}