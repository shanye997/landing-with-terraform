data "alicloud_threat_detection_honeypot_images" "default" {
  name_regex = "^ruoyi"
}

resource "alicloud_threat_detection_honeypot_node" "default" {
  node_name                    = var.name
  available_probe_num          = 20
  security_group_probe_ip_list = ["0.0.0.0/0"]
}

resource "alicloud_threat_detection_honey_pot" "default" {
  honeypot_image_id   = data.alicloud_threat_detection_honeypot_images.default.images.0.honeypot_image_id
  honeypot_image_name = "ruoyi"
  honeypot_name       = "${var.name}-u"
  node_id             = alicloud_threat_detection_honeypot_node.default.id
}
