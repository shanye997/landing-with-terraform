data "alicloud_hbr_oss_backup_plans" "default" {
  name_regex = "plan-tf-used-dont-delete"
}

data "alicloud_hbr_snapshots" "oss_snapshots" {
  source_type = "OSS"
  vault_id    = data.alicloud_hbr_oss_backup_plans.default.plans.0.vault_id
  bucket      = data.alicloud_hbr_oss_backup_plans.default.plans.0.bucket
}

resource "alicloud_hbr_restore_job" "default" {
  snapshot_id   = data.alicloud_hbr_snapshots.oss_snapshots.snapshots.0.snapshot_id
  source_type   = "OSS"
  vault_id      = data.alicloud_hbr_oss_backup_plans.default.plans.0.vault_id
  restore_type  = "OSS"
  include       = var.include_var
  options       = "{\"includes\":[],\"excludes\":[]}"
  snapshot_hash = data.alicloud_hbr_snapshots.oss_snapshots.snapshots.0.snapshot_hash
  target_bucket = data.alicloud_hbr_oss_backup_plans.default.plans.0.bucket
  target_prefix = ""
  exclude       = var.exclude_var
}
