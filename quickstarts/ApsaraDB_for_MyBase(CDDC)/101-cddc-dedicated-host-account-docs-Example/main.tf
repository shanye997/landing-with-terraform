variable "name" {
  default = "tf_example"
}
data "alicloud_cddc_zones" "default" {}
resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}
resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_cddc_zones.default.ids.0
}

resource "alicloud_cddc_dedicated_host_group" "default" {
  engine                    = "MySQL"
  vpc_id                    = alicloud_vpc.default.id
  cpu_allocation_ratio      = 101
  mem_allocation_ratio      = 50
  disk_allocation_ratio     = 200
  allocation_policy         = "Evenly"
  host_replace_policy       = "Manual"
  dedicated_host_group_desc = var.name
  open_permission           = true
}

data "alicloud_cddc_host_ecs_level_infos" "default" {
  db_type      = "mysql"
  zone_id      = data.alicloud_cddc_zones.default.ids.0
  storage_type = "cloud_essd"
}

resource "alicloud_cddc_dedicated_host" "default" {
  host_name               = var.name
  dedicated_host_group_id = alicloud_cddc_dedicated_host_group.default.id
  host_class              = data.alicloud_cddc_host_ecs_level_infos.default.infos.0.res_class_code
  zone_id                 = data.alicloud_cddc_zones.default.ids.0
  vswitch_id              = alicloud_vswitch.default.id
  payment_type            = "Subscription"
  tags = {
    Created = "TF"
    For     = "CDDC_DEDICATED"
  }
}

resource "alicloud_cddc_dedicated_host_account" "default" {
  account_name      = var.name
  account_password  = "Password1234"
  dedicated_host_id = alicloud_cddc_dedicated_host.default.dedicated_host_id
  account_type      = "Normal"
}