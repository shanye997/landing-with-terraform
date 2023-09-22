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

resource "alicloud_security_group" "group" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name = "${var.name}"
  vswitch_id         = data.alicloud_vswitches.default.ids[0]
  load_balancer_spec = "slb.s2.small"
}

resource "alicloud_ecs_network_interface" "default" {
  count           = 1
  name            = "${var.name}"
  vswitch_id      = data.alicloud_vswitches.default.ids[0]
  security_groups = ["${alicloud_security_group.group.id}"]
}

resource "alicloud_slb_backend_server" "default" {
  backend_servers {
    server_id = alicloud_ecs_network_interface.default.0.id
    server_ip = alicloud_ecs_network_interface.default.0.private_ip
    type      = "eni"
    weight    = "80"
  }

  load_balancer_id = alicloud_slb_load_balancer.default.id
}
