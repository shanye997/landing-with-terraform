data "alicloud_hbr_ecs_backup_plans" "default" {
  name_regex = "plan-tf-used-dont-delete"
}

data "alicloud_hbr_snapshots" "ecs_snapshots" {
  source_type = "ECS_FILE"
  vault_id    = data.alicloud_hbr_ecs_backup_plans.default.plans.0.vault_id
  instance_id = data.alicloud_hbr_ecs_backup_plans.default.plans.0.instance_id
}

resource "alicloud_hbr_restore_job" "default" {
  snapshot_id   = data.alicloud_hbr_snapshots.ecs_snapshots.snapshots.0.snapshot_id
  vault_id      = data.alicloud_hbr_ecs_backup_plans.default.plans.0.vault_id
  snapshot_hash = data.alicloud_hbr_snapshots.ecs_snapshots.snapshots.0.snapshot_hash
  source_type   = "ECS_FILE"
  restore_type  = "ECS_FILE"
}
