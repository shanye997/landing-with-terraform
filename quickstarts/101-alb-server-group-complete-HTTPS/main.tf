data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_server_group" "default" {
  sticky_session_config {
    cookie_timeout         = "2000"
    sticky_session_enabled = "true"
    sticky_session_type    = "Insert"
  }

  vpc_id = data.alicloud_vpcs.default.vpcs.0.id
  tags = {
    Created = "tfexample7"
    For     = "Tfexample7"
  }
  health_check_config {
    health_check_protocol     = "HTTP"
    unhealthy_threshold       = "3"
    health_check_connect_port = "46325"
    health_check_enabled      = "true"
    health_check_method       = "HEAD"
    health_check_interval     = "2"
    health_check_path         = "/tf-example"
    health_check_timeout      = "5"
    healthy_threshold         = "3"
    health_check_codes = [
      "http_2xx",
      "http_3xx",
      "http_4xx"
    ]
    health_check_host         = "tf-example.com"
    health_check_http_version = "HTTP1.1"
  }

  protocol          = "HTTPS"
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  scheduler         = var.scheduler_var
  server_group_name = var.server_group_name_var
}
