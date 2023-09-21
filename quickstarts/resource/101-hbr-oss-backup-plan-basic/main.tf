resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
}

resource "alicloud_hbr_oss_backup_plan" "default" {
  retention            = var.retention_var
  vault_id             = alicloud_hbr_vault.default.id
  schedule             = var.schedule_var
  oss_backup_plan_name = var.oss_backup_plan_name_var
  bucket               = alicloud_oss_bucket.default.bucket
  backup_type          = "COMPLETE"
}
