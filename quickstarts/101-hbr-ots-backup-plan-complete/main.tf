data "alicloud_account" "default" {
}

resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
  vault_type = "OTS_BACKUP"
}

resource "alicloud_ots_instance" "foo" {
  name        = var.name
  description = var.name
  accessed_by = "Any"
  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
}

resource "alicloud_ots_table" "basic" {
  instance_name = alicloud_ots_instance.foo.name
  table_name    = var.name
  primary_key {
    name = "pk1"
    type = "Integer"
  }
  time_to_live                  = -1
  max_version                   = 1
  deviation_cell_version_in_sec = 1
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

resource "alicloud_hbr_ots_backup_plan" "default" {
  retention               = var.retention_var
  cross_account_user_id   = data.alicloud_account.default.id
  cross_account_role_name = alicloud_ram_role.default.id
  ots_detail {
    table_names = [
      alicloud_ots_table.basic.table_name
    ]
  }

  rules {
    backup_type = "COMPLETE"
    disabled    = "false"
    retention   = "1"
    rule_name   = "example3829"
    schedule    = "I|1602673264|P1D"
  }

  instance_name        = alicloud_ots_instance.foo.name
  backup_type          = var.backup_type_var
  ots_backup_plan_name = var.ots_backup_plan_name_var
  cross_account_type   = "SELF_ACCOUNT"
  vault_id             = alicloud_hbr_vault.default.id
  disabled             = var.disabled_var
}
