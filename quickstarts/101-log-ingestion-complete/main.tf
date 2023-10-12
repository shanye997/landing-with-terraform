resource "alicloud_log_ingestion" "default" {
  time_zone       = var.time_zone_var
  run_immediately = var.run_immediately_var
  logstore        = "tf-examplelogingestion-1030681"
  description     = var.description_var
  source          = var.source_var
  project         = "tf-examplelogingestion-1030681"
  display_name    = var.display_name_var
  ingestion_name  = "test_ingestion"
  interval        = var.interval_var
}
