resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

resource "alicloud_nas_file_system" "default" {
  protocol_type = "NFS"
  storage_type  = "Performance"
  description   = var.name
  encrypt_type  = "1"
}

resource "alicloud_hbr_nas_backup_plan" "default" {
  file_system_id       = alicloud_nas_file_system.default.id
  schedule             = var.schedule_var
  backup_type          = "COMPLETE"
  vault_id             = alicloud_hbr_vault.default.id
  nas_backup_plan_name = var.nas_backup_plan_name_var
  path = [
    "/home/test2",
    "/home/test2"
  ]
  retention = var.retention_var
}
