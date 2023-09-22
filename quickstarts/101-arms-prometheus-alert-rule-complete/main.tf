data "alicloud_cs_managed_kubernetes_clusters" "default" {
  name_regex = "Default"
}

resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = var.name
  email              = "${var.name}@aaa.com"
}

resource "alicloud_arms_alert_contact_group" "default" {
  alert_contact_group_name = var.name
  contact_ids              = [alicloud_arms_alert_contact.default.id]
}

resource "alicloud_arms_dispatch_rule" "default" {
  dispatch_rule_name = var.name
  dispatch_type      = "CREATE_ALERT"
  group_rules {
    group_wait_time = 5
    group_interval  = 15
    repeat_interval = 100
    grouping_fields = [
    "alertname"]
  }
  label_match_expression_grid {
    label_match_expression_groups {
      label_match_expressions {
        key      = "_aliyun_arms_involvedObject_kind"
        value    = "app"
        operator = "eq"
      }
    }
  }

  notify_rules {
    notify_objects {
      notify_object_id = alicloud_arms_alert_contact.default.id
      notify_type      = "ARMS_CONTACT"
      name             = var.name
    }
    notify_objects {
      notify_object_id = alicloud_arms_alert_contact_group.default.id
      notify_type      = "ARMS_CONTACT_GROUP"
      name             = var.name
    }
    notify_channels = ["dingTalk", "wechat"]
  }
}

resource "alicloud_arms_prometheus_alert_rule" "default" {
  labels {
    name  = "TF2"
    value = "test2"
  }

  type                       = "tf-examplecn-hangzhouarmsprometheusalertrule28516"
  duration                   = "1"
  expression                 = "node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes * 100 < 20"
  cluster_id                 = data.alicloud_cs_managed_kubernetes_clusters.default.clusters.0.id
  message                    = "node available memory is less than 20%"
  prometheus_alert_rule_name = "tf-examplecn-hangzhouarmsprometheusalertrule28516"
  annotations {
    name  = "TF2"
    value = "test2"
  }

  notify_type      = var.notify_type_var
  dispatch_rule_id = alicloud_arms_dispatch_rule.default.id
}
