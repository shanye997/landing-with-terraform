resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_log_store" "default1" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}1"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_log_etl" "default" {
  script       = var.script_var
  display_name = var.display_name_var
  etl_sinks {
    access_key_id     = "test1"
    access_key_secret = "test2"
    endpoint          = "cn-hangzhou.log.aliyuncs.com"
    logstore          = alicloud_log_store.default1.name
    name              = "target_name"
    project           = alicloud_log_project.default.name
  }

  etl_name = "tf-examplelogossshipper-813328"
  project  = alicloud_log_project.default.name
  logstore = alicloud_log_store.default.name
}
