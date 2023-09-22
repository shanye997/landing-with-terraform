resource "alicloud_threat_detection_honeypot_node" "default" {
  node_name                    = var.name
  available_probe_num          = 20
  security_group_probe_ip_list = ["0.0.0.0/0"]
}

resource "alicloud_threat_detection_honeypot_probe" "default" {
  display_name    = "${var.name}"
  probe_type      = "host_probe"
  control_node_id = alicloud_threat_detection_honeypot_node.default.id
}
