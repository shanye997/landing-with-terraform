data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_nlb_server_group" "default" {
  scheduler         = var.scheduler_var
  server_group_name = var.name
  connection_drain  = var.connection_drain_var
  health_check {
    health_check_domain          = "tf-example.com"
    health_check_interval        = "10"
    health_check_type            = "TCP"
    health_check_connect_timeout = "5"
    health_check_enabled         = "true"
    health_check_http_code = [
      "http_2xx",
      "http_3xx",
      "http_4xx"
    ]
    health_check_url          = "/test/index.html"
    healthy_threshold         = "2"
    http_check_method         = "GET"
    unhealthy_threshold       = "2"
    health_check_connect_port = "0"
  }

  address_ip_version = "Ipv4"
  server_group_type  = "Instance"
  resource_group_id  = data.alicloud_resource_manager_resource_groups.default.ids.0
  protocol           = "TCP"
  tags = {
    Created = "tfexample6"
    For     = "Tfexample 6"
  }
  vpc_id                     = data.alicloud_vpcs.default.ids.0
  connection_drain_timeout   = var.connection_drain_timeout_var
  preserve_client_ip_enabled = var.preserve_client_ip_enabled_var
}
