data "alicloud_account" "default" {
}

data "alicloud_instances" "default" {
  status = "Running"
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

resource "alicloud_hbr_server_backup_plan" "default" {
  ecs_server_backup_plan_name = var.ecs_server_backup_plan_name_var
  retention                   = var.retention_var
  cross_account_type          = "SELF_ACCOUNT"
  disabled                    = var.disabled_var
  schedule                    = var.schedule_var
  detail {
    post_script_path      = "./example.js"
    pre_script_path       = "./example.js"
    timeout_in_seconds    = "180"
    enable_fs_freeze      = "false"
    destination_region_id = "cn-hangzhou"
    destination_retention = "1"
    disk_id_list = [

    ]
    do_copy        = "false"
    snapshot_group = "false"
    app_consistent = "true"
  }

  cross_account_user_id   = data.alicloud_account.default.id
  instance_id             = data.alicloud_instances.default.instances.0.id
  cross_account_role_name = alicloud_ram_role.default.id
}
