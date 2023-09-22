resource "alicloud_threat_detection_honeypot_node" "default" {
  allow_honeypot_access_internet = "true"
  available_probe_num            = var.available_probe_num_var
  node_name                      = "${var.name}"
  security_group_probe_ip_list = [
    "0.0.0.0/0",
    "10.0.0.0/8"
  ]
}
