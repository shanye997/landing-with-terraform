data "alicloud_instance_types" "default" {
  cpu_core_count    = 1
  memory_size       = 2
  availability_zone = data.alicloud_slb_zones.default.zones.0.id
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

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

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  image_id                   = "${data.alicloud_images.default.images.0.id}"
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  security_groups            = "${alicloud_security_group.default.*.id}"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = "${data.alicloud_instance_types.default.instance_types.0.availability_zones.0}"
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = data.alicloud_vswitches.default.ids[0]
  instance_name              = "${var.name}"
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = "${var.name}"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
  load_balancer_spec = "slb.s1.small"
}

resource "alicloud_slb_listener" "default" {
  load_balancer_id          = "${alicloud_slb_load_balancer.default.id}"
  backend_port              = 22
  frontend_port             = 22
  protocol                  = "http"
  bandwidth                 = 5
  health_check_connect_port = "20"
}

resource "alicloud_slb_server_group" "default" {
  load_balancer_id = "${alicloud_slb_load_balancer.default.id}"
  servers {
    server_ids = "${alicloud_instance.default.*.id}"
    port       = 80
    weight     = 100
  }
}

resource "alicloud_slb_rule" "default" {
  load_balancer_id          = alicloud_slb_load_balancer.default.id
  health_check_uri          = var.health_check_uri_var
  listener_sync             = var.listener_sync_var
  health_check_interval     = var.health_check_interval_var
  domain                    = "*.aliyun.com"
  scheduler                 = var.scheduler_var
  health_check              = var.health_check_var
  health_check_domain       = var.health_check_domain_var
  health_check_http_code    = var.health_check_http_code_var
  frontend_port             = alicloud_slb_listener.default.frontend_port
  cookie_timeout            = var.cookie_timeout_var
  sticky_session_type       = var.sticky_session_type_var
  cookie                    = var.cookie_var
  health_check_timeout      = var.health_check_timeout_var
  health_check_connect_port = var.health_check_connect_port_var
  server_group_id           = alicloud_slb_server_group.default.id
  unhealthy_threshold       = var.unhealthy_threshold_var
  sticky_session            = var.sticky_session_var
  name                      = var.name
  healthy_threshold         = var.healthy_threshold_var
  url                       = "/image"
}
