resource "alicloud_threat_detection_honeypot_probe" "default" {
  uuid            = "032b618f-b220-4a0d-bd37-fbdc6ef58b6a"
  probe_type      = "host_probe"
  control_node_id = "a44e1ab3-6945-444c-889d-5bacee7056e8"
  ping            = true
  honeypot_bind_list {
    bind_port_list {
      start_port = 80
      end_port   = 80
    }
    honeypot_id = "ede59ccdb1b7a2e21735d4593a6eb5ed31883af320c5ab63ab33818e94307be9"
  }
  display_name = "apispec"
  arp          = true
}