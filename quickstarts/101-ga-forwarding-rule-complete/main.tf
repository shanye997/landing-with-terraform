data "alicloud_ga_accelerators" "default" {
  status = "active"
}

resource "alicloud_ga_bandwidth_package" "default" {
  bandwidth              = 100
  type                   = "Basic"
  bandwidth_type         = "Basic"
  payment_type           = "PayAsYouGo"
  billing_type           = "PayBy95"
  ratio                  = 30
  bandwidth_package_name = var.name
  auto_pay               = true
  auto_use_coupon        = true
}

resource "alicloud_ga_bandwidth_package_attachment" "default" {
  // Please run resource ga_accelerator test case to ensure this account has at least one accelerator before run this case.
  accelerator_id       = data.alicloud_ga_accelerators.default.ids.0
  bandwidth_package_id = alicloud_ga_bandwidth_package.default.id
}

resource "alicloud_ga_listener" "default" {
  port_ranges {
    from_port = "70"
    to_port   = "70"
  }
  accelerator_id  = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  client_affinity = "SOURCE_IP"
  protocol        = "HTTP"
  name            = var.name
}

resource "alicloud_eip_address" "default" {
  bandwidth            = "10"
  internet_charge_type = "PayByBandwidth"
  address_name         = var.name
}

resource "alicloud_ga_endpoint_group" "default" {
  accelerator_id = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  endpoint_configurations {
    endpoint = alicloud_eip_address.default.ip_address
    type     = "PublicIp"
    weight   = "20"
  }
  description                   = var.name
  name                          = var.name
  threshold_count               = 4
  endpoint_group_region         = "cn-hangzhou"
  health_check_interval_seconds = "3"
  health_check_path             = "/healthcheck"
  health_check_port             = "9999"
  health_check_protocol         = "http"
  port_overrides {
    endpoint_port = "10"
    listener_port = "70"
  }
  traffic_percentage        = 20
  listener_id               = alicloud_ga_listener.default.id
  endpoint_group_type       = "virtual"
  endpoint_request_protocol = "HTTP"
}

resource "alicloud_ga_endpoint_group" "update" {
  accelerator_id = alicloud_ga_bandwidth_package_attachment.default.accelerator_id
  endpoint_configurations {
    endpoint = alicloud_eip_address.default.ip_address
    type     = "PublicIp"
    weight   = "20"
  }
  description                   = "${var.name}-update"
  name                          = "${var.name}-update"
  threshold_count               = 4
  endpoint_group_region         = "cn-hangzhou"
  health_check_interval_seconds = "3"
  health_check_path             = "/healthcheck"
  health_check_port             = "9999"
  health_check_protocol         = "http"
  port_overrides {
    endpoint_port = "10"
    listener_port = "70"
  }
  traffic_percentage        = 20
  listener_id               = alicloud_ga_listener.default.id
  endpoint_group_type       = "virtual"
  endpoint_request_protocol = "HTTP"
}

resource "alicloud_ga_forwarding_rule" "default" {
  rule_conditions {
    host_config {
      values = [
        "www.test3.com"
      ]
    }

    rule_condition_type = "Host"
  }

  accelerator_id       = alicloud_ga_endpoint_group.default.accelerator_id
  forwarding_rule_name = var.forwarding_rule_name_var
  listener_id          = alicloud_ga_listener.default.id
  priority             = var.priority_var
  rule_actions {
    order             = "30"
    rule_action_type  = "ForwardGroup"
    rule_action_value = "[{\"type\":\"endpointgroup\", \"value\":\"${alicloud_ga_endpoint_group.update.id}\"}]"
  }

}
