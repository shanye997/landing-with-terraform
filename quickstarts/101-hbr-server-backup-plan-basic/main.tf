data "alicloud_instances" "default" {
  status = "Running"
}

resource "alicloud_hbr_server_backup_plan" "default" {
  schedule = var.schedule_var
  detail {
    pre_script_path       = "./example.js"
    timeout_in_seconds    = "180"
    enable_fs_freeze      = "false"
    post_script_path      = "./example.js"
    destination_retention = "1"
    disk_id_list = [

    ]
    do_copy               = "false"
    snapshot_group        = "false"
    app_consistent        = "true"
    destination_region_id = "cn-hangzhou"
  }

  ecs_server_backup_plan_name = var.ecs_server_backup_plan_name_var
  retention                   = var.retention_var
  instance_id                 = data.alicloud_instances.default.instances.0.id
}
