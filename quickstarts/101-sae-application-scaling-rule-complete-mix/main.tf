data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_log_project" "default" {
  name = var.name
}

resource "alicloud_log_store" "update" {
  project = alicloud_log_project.default.name
  name    = "${var.name}-update"
}

resource "alicloud_slb_load_balancer" "default" {
  count              = 2
  load_balancer_name = var.name
  vswitch_id         = data.alicloud_vswitches.default.ids.0
  load_balancer_spec = "slb.s1.small"
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = join(":", ["cn-hangzhou", var.name])
  namespace_name        = var.name
}

resource "alicloud_sae_application" "default" {
  app_description = var.name
  app_name        = var.name
  namespace_id    = alicloud_sae_namespace.default.namespace_id
  image_url       = "registry-vpc.cn-hangzhou.aliyuncs.com/lxepoo/apache-php5"
  package_type    = "Image"
  jdk             = "Open JDK 8"
  vswitch_id      = data.alicloud_vswitches.default.ids.0
  vpc_id          = data.alicloud_vpcs.default.ids.0
  timezone        = "Asia/Shanghai"
  replicas        = "5"
  cpu             = "500"
  memory          = "2048"
}

resource "alicloud_sae_application_scaling_rule" "default" {
  scaling_rule_metric {
    scale_up_rules {
      disabled                     = "false"
      stabilization_window_seconds = "10"
      step                         = "90"
    }

    max_replicas = "40"
    metrics {
      metric_target_average_utilization = "30"
      metric_type                       = "CPU"
    }
    metrics {
      metric_target_average_utilization = "40"
      metric_type                       = "MEMORY"
    }
    metrics {
      metric_target_average_utilization = "30"
      metric_type                       = "tcpActiveConn"
    }
    metrics {
      vport                             = "8080"
      metric_target_average_utilization = "30"
      metric_type                       = "SLB_QPS"
      slb_id                            = alicloud_slb_load_balancer.default.1.id
      slb_log_store                     = alicloud_log_store.update.name
      slb_project                       = alicloud_log_store.update.project
    }

    min_replicas = "5"
    scale_down_rules {
      step                         = "90"
      disabled                     = "false"
      stabilization_window_seconds = "200"
    }

  }

  scaling_rule_name = var.name
  scaling_rule_timer {
    period = "* * *"
    schedules {
      at_time      = "08:00"
      max_replicas = "20"
      min_replicas = "3"
    }
    schedules {
      at_time      = "20:00"
      max_replicas = "10"
      min_replicas = "3"
    }

  }

  scaling_rule_type        = "mix"
  app_id                   = alicloud_sae_application.default.id
  min_ready_instance_ratio = var.min_ready_instance_ratio_var
  min_ready_instances      = var.min_ready_instances_var
  scaling_rule_enable      = var.scaling_rule_enable_var
}
