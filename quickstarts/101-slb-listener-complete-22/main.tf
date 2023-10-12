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

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id            = "${alicloud_vpc.default.id}"
  cidr_block        = "172.16.0.0/16"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  name              = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_instance" "default" {
  image_id                   = "${data.alicloud_images.default.images.0.id}"
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  instance_name              = "${var.name}"
  count                      = "2"
  security_groups            = "${alicloud_security_group.default.*.id}"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = "${data.alicloud_zones.default.zones.0.id}"
  instance_charge_type       = "PostPaid"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = "${alicloud_vswitch.default.id}"
}

resource "alicloud_slb_master_slave_server_group" "default" {
  load_balancer_id = "${alicloud_slb_load_balancer.default.id}"
  name             = "${var.name}"
  servers {
    server_id   = "${alicloud_instance.default.0.id}"
    port        = 80
    weight      = 100
    server_type = "Master"
  }
  servers {
    server_id   = "${alicloud_instance.default.1.id}"
    port        = 80
    weight      = 100
    server_type = "Slave"
  }
}

resource "alicloud_slb_listener" "default" {
  health_check_connect_port    = var.health_check_connect_port_var
  health_check_interval        = var.health_check_interval_var
  scheduler                    = var.scheduler_var
  frontend_port                = "22"
  unhealthy_threshold          = var.unhealthy_threshold_var
  server_group_id              = var.server_group_id_var
  health_check_domain          = var.health_check_domain_var
  health_check_timeout         = var.health_check_timeout_var
  persistence_timeout          = var.persistence_timeout_var
  master_slave_server_group_id = alicloud_slb_master_slave_server_group.default.id
  healthy_threshold            = var.healthy_threshold_var
  backend_port                 = "22"
  health_check_uri             = var.health_check_uri_var
  established_timeout          = var.established_timeout_var
  proxy_protocol_v2_enabled    = var.proxy_protocol_v2_enabled_var
  load_balancer_id             = alicloud_slb_load_balancer.default.id
  health_check_type            = var.health_check_type_var
  protocol                     = "tcp"
  acl_status                   = var.acl_status_var
  bandwidth                    = var.bandwidth_var
  description                  = var.description_var
  acl_type                     = var.acl_type_var
  acl_id                       = alicloud_slb_acl.default.id
  health_check_http_code       = var.health_check_http_code_var
}
