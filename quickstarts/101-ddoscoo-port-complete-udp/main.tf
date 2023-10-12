data "alicloud_ddoscoo_instances" "default" {}

resource "alicloud_ddoscoo_port" "default" {
  frontend_port     = "54533"
  frontend_protocol = "udp"
  instance_id       = data.alicloud_ddoscoo_instances.default.ids.0
  real_servers = [
    "192.168.0.1"
  ]
  backend_port = "54534"
}
