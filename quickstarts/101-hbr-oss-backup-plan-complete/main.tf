data "alicloud_account" "default" {
}

resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
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

resource "alicloud_hbr_oss_backup_plan" "default" {
  retention               = var.retention_var
  cross_account_type      = "SELF_ACCOUNT"
  cross_account_user_id   = data.alicloud_account.default.id
  prefix                  = var.prefix_var
  cross_account_role_name = alicloud_ram_role.default.id
  disabled                = var.disabled_var
  vault_id                = alicloud_hbr_vault.default.id
  schedule                = var.schedule_var
  backup_type             = "COMPLETE"
  bucket                  = alicloud_oss_bucket.default.bucket
  oss_backup_plan_name    = var.oss_backup_plan_name_var
}
