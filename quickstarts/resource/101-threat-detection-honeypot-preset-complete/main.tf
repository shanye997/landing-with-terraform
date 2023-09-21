resource "alicloud_threat_detection_honeypot_node" "default" {
  node_name                    = var.name
  available_probe_num          = 20
  security_group_probe_ip_list = ["0.0.0.0/0"]
}

resource "alicloud_threat_detection_honeypot_preset" "default" {
  meta {
    burp            = "open"
    portrait_option = "true"
    trojan_git      = "open"
  }

  node_id             = alicloud_threat_detection_honeypot_node.default.id
  preset_name         = var.name
  honeypot_image_name = "shiro"
}
