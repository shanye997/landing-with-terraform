data "alicloud_nlb_zones" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_vswitches" "default_1" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_nlb_zones.default.zones.0.id
}

data "alicloud_vswitches" "default_2" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_nlb_zones.default.zones.1.id
}

locals {
  zone_id_1    = data.alicloud_nlb_zones.default.zones.0.id
  vswitch_id_1 = data.alicloud_vswitches.default_1.ids[0]
  zone_id_2    = data.alicloud_nlb_zones.default.zones.1.id
  vswitch_id_2 = data.alicloud_vswitches.default_2.ids[0]
}

resource "alicloud_nlb_load_balancer" "default" {
  load_balancer_name = var.name
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0
  load_balancer_type = "Network"
  address_type       = "Internet"
  address_ip_version = "Ipv4"
  vpc_id             = data.alicloud_vpcs.default.ids.0
  zone_mappings {
    vswitch_id = local.vswitch_id_1
    zone_id    = local.zone_id_1
  }
  zone_mappings {
    vswitch_id = local.vswitch_id_2
    zone_id    = local.zone_id_2
  }
}

resource "alicloud_nlb_server_group" "default" {
  server_group_name = var.name
  server_group_type = "Instance"
  vpc_id            = data.alicloud_vpcs.default.ids.0
  scheduler         = "Wrr"
  protocol          = "TCPSSL"
  health_check {
    health_check_url             = "/test/index.html"
    health_check_domain          = "tf-example.com"
    health_check_enabled         = true
    health_check_type            = "TCP"
    health_check_connect_port    = 0
    healthy_threshold            = 2
    unhealthy_threshold          = 2
    health_check_connect_timeout = 5
    health_check_interval        = 10
    http_check_method            = "GET"
    health_check_http_code       = ["http_2xx", "http_3xx", "http_4xx"]
  }
  tags = {
    Created = "TF"
  }
  address_ip_version = "Ipv4"
}

resource "alicloud_nlb_listener" "default" {
  listener_protocol      = "TCPSSL"
  listener_port          = "1883"
  listener_description   = var.name
  security_policy_id     = "tls_cipher_policy_1_0"
  load_balancer_id       = alicloud_nlb_load_balancer.default.id
  server_group_id        = alicloud_nlb_server_group.default.id
  idle_timeout           = "900"
  certificate_ids        = ["8697931-cn-hangzhou"]
  proxy_protocol_enabled = "true"
  sec_sensor_enabled     = "true"
  alpn_enabled           = "true"
  alpn_policy            = "HTTP2Optional"
  cps                    = "10000"
  mss                    = "0"
}

resource "alicloud_nlb_listener_additional_certificate_attachment" "default" {
  certificate_id = local.certificate_id
  listener_id    = alicloud_nlb_listener.default.id
}
