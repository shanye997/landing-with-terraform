data "alicloud_gpdb_instances" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_gpdb_db_instance_plan" "default" {
  plan_schedule_type = "Regular"
  db_instance_id     = data.alicloud_gpdb_instances.default.ids.0
  plan_config {
    pause {
      plan_cron_time = "0 0 10 1/1 * ? "
    }

    resume {
      plan_cron_time = "0 0 0 1/1 * ? "
    }

  }

  db_instance_plan_name = var.name
  plan_type             = "PauseResume"
}
