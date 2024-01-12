resource "alicloud_alidns_custom_line" "default" {
  custom_line_name = "tf-example"
  domain_name      = "alicloud-provider.com"
  ip_segment_list {
    start_ip = "192.0.2.123"
    end_ip   = "192.0.2.125"
  }
}