data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_nlb_server_group" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  server_group_name = var.name
  server_group_type = "Ip"
  vpc_id            = data.alicloud_vpcs.default.ids.0
  scheduler         = "Wrr"
  protocol          = "TCP"
  health_check {
    health_check_enabled = false
  }
  address_ip_version = "Ipv4"
}

resource "alicloud_nlb_server_group_server_attachment" "default" {
  description     = "${var.name}"
  port            = "80"
  server_group_id = alicloud_nlb_server_group.default.id
  server_id       = "10.0.0.0"
  server_ip       = "10.0.0.0"
  server_type     = "Ip"
  weight          = var.weight_var
}
