resource "alicloud_threat_detection_honeypot_node" "default" {
  available_probe_num = var.available_probe_num_var
  node_name           = "${var.name}"
}
