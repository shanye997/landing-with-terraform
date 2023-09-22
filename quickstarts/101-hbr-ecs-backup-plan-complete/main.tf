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

data "alicloud_account" "default" {
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

resource "alicloud_ram_role" "default" {
  name     = var.name
  document = <<EOF
		{
			"Statement": [
			{
				"Action": "sts:AssumeRole",
				"Effect": "Allow",
				"Principal": {
					"Service": [
						"crossbackup.hbr.aliyuncs.com"
					]
				}
			}
			],
  			"Version": "1"
		}
  		EOF
  force    = true
}

resource "alicloud_hbr_ecs_backup_plan" "default" {
  exclude                 = var.exclude_var
  options                 = var.options_var
  instance_id             = alicloud_instance.default.id
  cross_account_user_id   = data.alicloud_account.default.id
  schedule                = var.schedule_var
  include                 = var.include_var
  speed_limit             = var.speed_limit_var
  disabled                = var.disabled_var
  backup_type             = "COMPLETE"
  cross_account_type      = "SELF_ACCOUNT"
  cross_account_role_name = alicloud_ram_role.default.id
  ecs_backup_plan_name    = var.ecs_backup_plan_name_var
  retention               = var.retention_var
  vault_id                = alicloud_hbr_vault.default.id
  path = [
    "/home/test2",
    "/home/test2"
  ]
}
