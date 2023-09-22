data "alicloud_hbr_ecs_backup_plans" "default" {
  name_regex = "plan-tf-used-dont-delete"
}

data "alicloud_hbr_snapshots" "ecs_snapshots" {
  source_type = "ECS_FILE"
  vault_id    = data.alicloud_hbr_ecs_backup_plans.default.plans.0.vault_id
  instance_id = data.alicloud_hbr_ecs_backup_plans.default.plans.0.instance_id
}

resource "alicloud_hbr_restore_job" "default" {
  target_instance_id = data.alicloud_hbr_ecs_backup_plans.default.plans.0.instance_id
  target_path        = "/"
  restore_job_id     = "tf-example80874"
  restore_type       = "ECS_FILE"
  snapshot_hash      = data.alicloud_hbr_snapshots.ecs_snapshots.snapshots.0.snapshot_hash
  snapshot_id        = data.alicloud_hbr_snapshots.ecs_snapshots.snapshots.0.snapshot_id
  source_type        = "ECS_FILE"
  exclude            = var.exclude_var
  include            = var.include_var
  vault_id           = data.alicloud_hbr_ecs_backup_plans.default.plans.0.vault_id
}
