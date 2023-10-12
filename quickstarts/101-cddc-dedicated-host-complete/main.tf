data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_cddc_zones" "default" {}

data "alicloud_cddc_host_ecs_level_infos" "default" {
  db_type      = "mysql"
  zone_id      = data.alicloud_cddc_zones.default.ids.0
  storage_type = "cloud_essd"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_cddc_zones.default.ids.0
}

data "alicloud_cddc_dedicated_host_groups" "default" {
  engine = "MySQL"
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
  dedicated_host_group_desc = var.name
  open_permission           = true
}

locals {
  dedicated_host_group_id = length(data.alicloud_cddc_dedicated_host_groups.default.ids) > 0 ? data.alicloud_cddc_dedicated_host_groups.default.ids.0 : concat(alicloud_cddc_dedicated_host_group.default[*].id, [""])[0]
}

resource "alicloud_cddc_dedicated_host" "default" {
  allocation_status       = var.allocation_status_var
  vswitch_id              = data.alicloud_vswitches.default.ids.0
  zone_id                 = data.alicloud_cddc_zones.default.ids.0
  image_category          = var.image_category_var
  used_time               = var.used_time_var
  os_password             = var.os_password_var
  dedicated_host_group_id = local.dedicated_host_group_id
  host_class              = data.alicloud_cddc_host_ecs_level_infos.default.infos.1.res_class_code
  host_name               = "${var.name}"
  payment_type            = var.payment_type_var
  tags = {
    Created = "TF"
    For     = "CDDC_DEDICATED"
  }
  auto_renew = var.auto_renew_var
  period     = var.period_var
}
