resource "alicloud_hbr_ots_backup_plan" "default" {
  retention            = var.retention_var
  ots_backup_plan_name = var.ots_backup_plan_name_var
  backup_type          = var.backup_type_var
}
