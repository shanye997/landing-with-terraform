data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_alb_server_group" "default" {
  servers {
    server_ip         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 2)
    server_type       = "Ip"
    weight            = "10"
    description       = "tf-example1"
    port              = "80"
    remote_ip_enabled = "false"
    server_id         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 2)
  }
  servers {
    weight            = "10"
    description       = "tf-example1"
    port              = "88"
    remote_ip_enabled = "false"
    server_id         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 3)
    server_ip         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 3)
    server_type       = "Ip"
  }

}
