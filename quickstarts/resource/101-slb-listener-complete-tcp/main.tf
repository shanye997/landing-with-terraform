resource "alicloud_slb_load_balancer" "default" {
  load_balancer_name   = "${var.name}"
  internet_charge_type = "PayByTraffic"
  address_type         = "internet"
  load_balancer_spec   = "slb.s1.small"
}

resource "alicloud_slb_listener" "default" {
  backend_port     = "80"
  bandwidth        = var.bandwidth_var
  frontend_port    = "80"
  load_balancer_id = alicloud_slb_load_balancer.default.id
  protocol         = "tcp"
}
