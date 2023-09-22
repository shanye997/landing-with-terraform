data "alicloud_instances" "default" {
  name_regex = "no-deleteing-hbr-ecs-backup-plan"
  status     = "Running"
}

resource "alicloud_hbr_ecs_backup_client" "default" {
  instance_id = data.alicloud_instances.default.instances.0.id
}
