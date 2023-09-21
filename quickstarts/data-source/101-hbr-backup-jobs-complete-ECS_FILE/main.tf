data "alicloud_hbr_ecs_backup_plans" "default" {
}

data "alicloud_hbr_backup_jobs" "default" {
  status = "PARTIAL_COMPLETE"
  filter {
    key      = "VaultId"
    operator = "IN"
    values = [
      data.alicloud_hbr_ecs_backup_plans.default.plans.0.vault_id
    ]
  }
  filter {
    key      = "InstanceId"
    operator = "IN"
    values = [
      "${data.alicloud_hbr_ecs_backup_plans.default.plans.0.instance_id}_fake"
    ]
  }

  source_type = "ECS_FILE"
}
