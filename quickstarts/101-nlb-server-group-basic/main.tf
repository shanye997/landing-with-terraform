data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_nlb_server_group" "default" {
  vpc_id = data.alicloud_vpcs.default.ids.0
  health_check {
    healthy_threshold         = "2"
    http_check_method         = "GET"
    unhealthy_threshold       = "2"
    health_check_connect_port = "0"
    health_check_enabled      = "true"
    health_check_http_code = [
      "http_2xx",
      "http_3xx",
      "http_4xx"
    ]
    health_check_url             = "/test/index.html"
    health_check_connect_timeout = "5"
    health_check_domain          = "tf-example.com"
    health_check_interval        = "10"
    health_check_type            = "TCP"
  }

  server_group_name = var.name
}
