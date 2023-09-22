resource "alicloud_log_ingestion" "default" {
  interval        = var.interval_var
  source          = var.source_var
  display_name    = var.display_name_var
  project         = "tf-examplelogingestion-1030681"
  run_immediately = var.run_immediately_var
  ingestion_name  = "test_ingestion"
  logstore        = "tf-examplelogingestion-1030681"
}
