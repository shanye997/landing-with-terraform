data "alicloud_gpdb_instances" "default" {
  name_regex = "default-NODELETING"
}

resource "alicloud_gpdb_db_instance_plan" "default" {
  plan_desc             = var.name
  plan_end_date         = var.plan_end_date
  plan_schedule_type    = "Regular"
  plan_start_date       = var.plan_start_date
  plan_type             = "Resize"
  db_instance_id        = data.alicloud_gpdb_instances.default.ids.0
  db_instance_plan_name = var.name
  plan_config {
    scale_in {
      plan_cron_time   = "0 0 10 1/1 * ? "
      segment_node_num = "2"
    }

    scale_out {
      plan_cron_time   = "0 0 0 1/1 * ? "
      segment_node_num = "4"
    }

  }

}
