data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_server_group" "default" {
  vpc_id   = data.alicloud_vpcs.default.ids.0
  protocol = "HTTP"
  health_check_config {
    health_check_enabled = "false"
  }

  dry_run           = var.dry_run_var
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  sticky_session_config {
    sticky_session_enabled = "false"
  }

  server_group_name = var.name
  server_group_type = "Ip"
  servers {
    description       = "tf-example1"
    port              = "80"
    remote_ip_enabled = "false"
    server_id         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 2)
    server_ip         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 2)
    server_type       = "Ip"
    weight            = "10"
  }
  servers {
    description       = "tf-example1"
    port              = "88"
    remote_ip_enabled = "false"
    server_id         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 3)
    server_ip         = cidrhost(data.alicloud_vpcs.default.vpcs.0.cidr_block, 3)
    server_type       = "Ip"
    weight            = "10"
  }

}
