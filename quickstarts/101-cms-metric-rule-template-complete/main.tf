data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_slb_zones" "default" {
  available_slb_address_type = "vpc"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_slb_zones.default.zones.0.id
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = var.name
  load_balancer_spec = "slb.s2.small"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
}

resource "alicloud_cms_monitor_group" "default" {
  monitor_group_name = var.name
}

resource "alicloud_cms_monitor_group_instances" "default" {
  group_id = alicloud_cms_monitor_group.default.id
  instances {
    instance_id   = alicloud_slb_load_balancer.default.id
    instance_name = alicloud_slb_load_balancer.default.name
    region_id     = "cn-hangzhou"
    category      = "slb"
  }
}

locals {
  group_id = alicloud_cms_monitor_group_instances.default.id
}

resource "alicloud_cms_metric_rule_template" "default" {
  alert_templates {
    metric_name = "cpu_total"
    namespace   = "acs_ecs_dashboard"
    rule_name   = "tf_example"
    category    = "ecs"
    escalations {
      critical {
        comparison_operator = "GreaterThanThreshold"
        statistics          = "Average"
        threshold           = "90"
        times               = "3"
      }

      info {
        threshold           = "90"
        times               = "3"
        comparison_operator = "GreaterThanThreshold"
        statistics          = "Average"
      }

      warn {
        comparison_operator = "GreaterThanThreshold"
        statistics          = "Average"
        threshold           = "90"
        times               = "3"
      }

    }

  }

  group_id                  = local.group_id
  silence_time              = var.silence_time_var
  webhook                   = var.webhook_var
  enable_start_time         = var.enable_start_time_var
  metric_rule_template_name = var.name
  notify_level              = var.notify_level_var
  apply_mode                = var.apply_mode_var
  description               = var.name
  enable_end_time           = var.enable_end_time_var
}
