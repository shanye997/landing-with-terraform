data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_server_group" "default" {
  health_check_config {
    health_check_enabled = "false"
  }

  protocol          = "HTTP"
  vpc_id            = data.alicloud_vpcs.default.ids.0
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  dry_run           = var.dry_run_var
  server_group_name = var.server_group_name_var
  server_group_type = "Fc"
  sticky_session_config {
    sticky_session_enabled = "false"
  }

}
