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

resource "alicloud_log_machine_group" "default" {
  count         = 2
  project       = "${alicloud_log_project.default.name}"
  name          = "${var.name}-${count.index}"
  topic         = "terraform"
  identify_list = ["10.0.0.1", "10.0.0.3", "10.0.0.2"]
}

resource "alicloud_logtail_config" "default" {
  project      = "${alicloud_log_project.default.name}"
  logstore     = "${alicloud_log_store.default.name}"
  input_type   = "file"
  log_sample   = "test-update"
  name         = "${var.name}"
  output_type  = "LogService"
  input_detail = <<DEFINITION
  	{
		"logPath": "/logPath",
		"filePattern": "access.log",
		"logType": "json_log",
		"topicFormat": "default",
		"discardUnmatch": false,
		"enableRawLog": true,
		"fileEncoding": "gbk",
		"maxDepth": 10
	}
	DEFINITION
}

resource "alicloud_logtail_attachment" "default" {
  logtail_config_name = alicloud_logtail_config.default.name
  machine_group_name  = element(alicloud_log_machine_group.default.*.name, count.index)
  project             = alicloud_log_project.default.name
  count               = "2"
}
