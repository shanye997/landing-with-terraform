resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name   = "${var.name}"
  internet_charge_type = "PayByTraffic"
  address_type         = "internet"
  load_balancer_spec   = "slb.s1.small"
}

resource "alicloud_slb_acl" "default" {
  name       = "${var.name}"
  ip_version = "${var.ip_version}"
  entry_list {
    entry   = "10.10.10.0/24"
    comment = "first"
  }
  entry_list {
    entry   = "168.10.10.0/24"
    comment = "second"
  }
}

resource "alicloud_slb_listener" "default" {
  healthy_threshold         = var.healthy_threshold_var
  acl_id                    = alicloud_slb_acl.default.id
  description               = var.description_var
  persistence_timeout       = var.persistence_timeout_var
  backend_port              = "2001"
  acl_status                = var.acl_status_var
  frontend_port             = "2001"
  bandwidth                 = var.bandwidth_var
  load_balancer_id          = alicloud_slb_load_balancer.default.id
  acl_type                  = var.acl_type_var
  health_check_interval     = var.health_check_interval_var
  health_check_timeout      = var.health_check_timeout_var
  proxy_protocol_v2_enabled = var.proxy_protocol_v2_enabled_var
  protocol                  = "udp"
  health_check_connect_port = var.health_check_connect_port_var
  scheduler                 = var.scheduler_var
  unhealthy_threshold       = var.unhealthy_threshold_var
}
