resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "create by terraform"
}

resource "alicloud_log_store" "default" {
  project               = "${alicloud_log_project.default.name}"
  name                  = "${var.name}"
  retention_period      = 3650
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_logtail_config" "default" {
  project      = alicloud_log_project.default.name
  input_detail = var.input_detail_var
  input_type   = var.input_type_var
  log_sample   = var.log_sample_var
  logstore     = alicloud_log_store.default.name
  name         = "tf-examplelogtailconfig-1696563"
  output_type  = var.output_type_var
}
