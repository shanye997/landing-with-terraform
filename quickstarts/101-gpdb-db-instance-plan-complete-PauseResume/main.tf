data "alicloud_gpdb_instances" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_gpdb_db_instance_plan" "default" {
  plan_desc          = var.name
  plan_schedule_type = "Regular"
  plan_start_date    = var.plan_start_date
  db_instance_id     = data.alicloud_gpdb_instances.default.ids.0
  status             = var.status_var
  plan_config {
    pause {
      plan_cron_time = "0 0 10 1/1 * ? "
    }

    resume {
      plan_cron_time = "0 0 0 1/1 * ? "
    }

  }

  plan_end_date         = var.plan_end_date
  plan_type             = "PauseResume"
  db_instance_plan_name = var.name
}
