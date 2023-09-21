resource "alicloud_alidns_custom_line" "default" {
  ip_segment_list {
    end_ip   = "192.0.2.125"
    start_ip = "192.0.2.123"
  }

  custom_line_name = var.custom_line_name_var
  domain_name      = var.domain_name
}
