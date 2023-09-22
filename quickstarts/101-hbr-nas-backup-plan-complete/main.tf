data "alicloud_account" "default" {
}

resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = var.name
  encrypt_type  = "1"
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

resource "alicloud_hbr_nas_backup_plan" "default" {
  disabled                = var.disabled_var
  retention               = var.retention_var
  cross_account_role_name = alicloud_ram_role.default.id
  schedule                = var.schedule_var
  file_system_id          = alicloud_nas_file_system.default.id
  nas_backup_plan_name    = var.nas_backup_plan_name_var
  cross_account_type      = "SELF_ACCOUNT"
  options                 = var.options_var
  vault_id                = alicloud_hbr_vault.default.id
  backup_type             = "COMPLETE"
  path = [
    "/home/test2",
    "/home/test2"
  ]
  cross_account_user_id = data.alicloud_account.default.id
}
