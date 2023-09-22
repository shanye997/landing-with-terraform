data "alicloud_threat_detection_assets" "default" {
  machine_types = "ecs"
  ids           = ["53926396-0690-49a4-aa08-a38ca4853cdf"]
}

resource "alicloud_threat_detection_honeypot_node" "default" {
  node_name                    = var.name
  available_probe_num          = 20
  security_group_probe_ip_list = ["0.0.0.0/0"]
}

data "alicloud_threat_detection_honeypot_images" "default" {
  name_regex = "^ruoyi"
}

resource "alicloud_threat_detection_honey_pot" "default" {
  honeypot_image_name = "ruoyi"
  honeypot_image_id   = data.alicloud_threat_detection_honeypot_images.default.images.0.honeypot_image_id
  honeypot_name       = var.name
  node_id             = alicloud_threat_detection_honeypot_node.default.id
}

resource "alicloud_threat_detection_honeypot_probe" "default" {
  control_node_id = alicloud_threat_detection_honeypot_node.default.id
  display_name    = "${var.name}"
  honeypot_bind_list {
    bind_port_list {
      end_port   = "80"
      start_port = "80"
    }

    honeypot_id = alicloud_threat_detection_honey_pot.default.id
  }

  ping       = var.ping_var
  probe_type = "host_probe"
  uuid       = data.alicloud_threat_detection_assets.default.assets.0.uuid
  arp        = var.arp_var
}
