data "alicloud_ddoscoo_instances" "default" {}

resource "alicloud_ddoscoo_port" "default" {
  real_servers = [
    "192.168.0.1"
  ]
  frontend_port     = "62005"
  frontend_protocol = "tcp"
  instance_id       = data.alicloud_ddoscoo_instances.default.ids.0
}
