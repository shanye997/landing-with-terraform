data "alicloud_mongodb_zones" "default" {
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_vswitch" "this" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vswitch_name = var.name
  vpc_id       = data.alicloud_vpcs.default.ids.0
  zone_id      = data.alicloud_mongodb_zones.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs.0.cidr_block, 8, 4)
}

locals {
  zone_id    = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.vswitches.0.zone_id : data.alicloud_mongodb_zones.default.zones.0.id
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.this.*.id, [""])[0]
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_mongodb_instance" "default" {
  db_instance_storage = var.db_instance_storage_var
  backup_time         = var.backup_time_var
  storage_type        = "cloud_essd1"
  security_ip_list = [
    "10.168.1.12"
  ]
  maintain_end_time    = var.maintain_end_time_var
  instance_charge_type = var.instance_charge_type_var
  account_password     = var.account_password_var
  vpc_id               = data.alicloud_vpcs.default.ids.0
  zone_id              = local.zone_id
  vswitch_id           = local.vswitch_id
  ssl_action           = var.ssl_action_var
  name                 = var.name_var
  hidden_zone_id       = data.alicloud_mongodb_zones.default.ids.1
  readonly_replicas    = var.readonly_replicas_var
  secondary_zone_id    = data.alicloud_mongodb_zones.default.ids.2
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.ids.0
  security_group_id    = alicloud_security_group.default.id
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  backup_period = [
    "Wednesday"
  ]
  engine_version      = "4.2"
  db_instance_class   = var.db_instance_class_var
  maintain_start_time = var.maintain_start_time_var
  parameters {
    name  = "setParameter.flowControlTargetLagSeconds"
    value = "10"
  }

  network_type = "VPC"
}
