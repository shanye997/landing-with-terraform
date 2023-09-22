resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "create by terraform"
}

resource "alicloud_log_store" "default" {
  project               = "${alicloud_log_project.default.name}"
  name                  = "${var.name}"
  retention_period      = 3000
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_log_alert" "default" {
  auto_annotation = var.auto_annotation_var
  version         = var.version_var
  send_resolved   = var.send_resolved_var
  severity_configurations {
    eval_condition = {

    }
    severity = "8"
  }
  severity_configurations {
    eval_condition = {

    }
    severity = "6"
  }
  severity_configurations {
    eval_condition = {

    }
    severity = "4"
  }

  join_configurations {
    condition = "$0.cnt == $1.cnt"
    type      = "left_join"
  }

  alert_name = "alert_name"
  mute_until = var.mute_until_var
  schedule {
    type     = "FixedRate"
    interval = "1m"
  }

  template_configuration {
    tokens = {

    }
    type = "sys"
    annotations = {

    }
    id   = "sls.app.sls_ack.node.down"
    lang = "cn"
  }

  query_list {
    store          = alicloud_log_store.default.name
    store_type     = "log"
    chart_title    = "chart_title"
    end            = "60s"
    power_sql_mode = "enable"
    query          = "* AND aliyun"
    region         = "cn-heyuan"
    start          = "-80s"
  }
  query_list {
    store       = alicloud_log_store.default.name
    store_type  = "log"
    chart_title = "chart_title_2"
    end         = "20s"
    query       = "error and update | select count(1) as error_cnt"
    region      = "cn-heyuan"
    start       = "-60s"
  }

  group_configuration {
    type = "custom"
    fields = [
      "a",
      "b",
      "c"
    ]
  }

  alert_displayname = var.alert_displayname_var
  no_data_severity  = var.no_data_severity_var
  type              = var.type_var
  annotations {
    key   = "title"
    value = "alert title new"
  }
  annotations {
    value = "alert desc new"
    key   = "desc"
  }
  annotations {
    key   = "test_key"
    value = "test value new"
  }

  no_data_fire = var.no_data_fire_var
  project_name = alicloud_log_project.default.name
  labels {
    key   = "env"
    value = "test new"
  }
  labels {
    key   = "team"
    value = "test team"
  }

  policy_configuration {
    action_policy_id = "test_action_policy_new"
    alert_policy_id  = "sls.builtin.dynamic"
    repeat_interval  = "3h"
  }

}
