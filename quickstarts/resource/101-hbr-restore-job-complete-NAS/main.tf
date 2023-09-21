data "alicloud_account" "default" {
}

data "alicloud_hbr_nas_backup_plans" "default" {
  name_regex = "plan-tf-used-dont-delete"
}

data "alicloud_hbr_snapshots" "nas_snapshots" {
  source_type    = "NAS"
  vault_id       = data.alicloud_hbr_nas_backup_plans.default.plans.0.vault_id
  file_system_id = data.alicloud_hbr_nas_backup_plans.default.plans.0.file_system_id
  create_time    = data.alicloud_hbr_nas_backup_plans.default.plans.0.create_time
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

resource "alicloud_hbr_restore_job" "default" {
  exclude                 = var.exclude_var
  target_create_time      = data.alicloud_hbr_nas_backup_plans.default.plans.0.create_time
  target_path             = "/"
  cross_account_role_name = alicloud_ram_role.default.id
  cross_account_type      = "SELF_ACCOUNT"
  snapshot_id             = data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_id
  source_type             = "NAS"
  include                 = var.include_var
  options                 = "{\"includes\":[],\"excludes\":[]}"
  snapshot_hash           = data.alicloud_hbr_snapshots.nas_snapshots.snapshots.0.snapshot_hash
  target_file_system_id   = data.alicloud_hbr_nas_backup_plans.default.plans.0.file_system_id
  vault_id                = data.alicloud_hbr_nas_backup_plans.default.plans.0.vault_id
  cross_account_user_id   = data.alicloud_account.default.id
  restore_type            = "NAS"
}
