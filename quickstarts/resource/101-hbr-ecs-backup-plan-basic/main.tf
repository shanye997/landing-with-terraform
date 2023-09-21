data "alicloud_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
}

data "alicloud_images" "default" {
  name_regex = "^centos_6"
}

resource "alicloud_hbr_vault" "default" {
  vault_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  instance_name     = var.name
  availability_zone = data.alicloud_zones.default.zones.0.id
  vswitch_id        = data.alicloud_vswitches.default.ids.0
  security_groups   = [alicloud_security_group.default.id]
  instance_type     = data.alicloud_instance_types.default.instance_types.0.id
  image_id          = data.alicloud_images.default.images.0.id
}

resource "alicloud_hbr_ecs_backup_plan" "default" {
  schedule             = var.schedule_var
  retention            = var.retention_var
  instance_id          = alicloud_instance.default.id
  vault_id             = alicloud_hbr_vault.default.id
  ecs_backup_plan_name = var.ecs_backup_plan_name_var
  backup_type          = "COMPLETE"
}
