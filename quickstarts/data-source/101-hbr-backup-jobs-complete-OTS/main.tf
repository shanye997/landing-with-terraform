data "alicloud_hbr_backup_jobs" "default" {
  filter {
    operator = "EQUAL"
    values = [
      "COMPLETE"
    ]
    key = "Status"
  }

  source_type = "OTS"
}
