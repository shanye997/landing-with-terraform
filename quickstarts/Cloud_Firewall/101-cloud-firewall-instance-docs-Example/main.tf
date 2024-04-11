resource "alicloud_cloud_firewall_instance" "default" {
  payment_type    = "PayAsYouGo"
  spec            = "ultimate_version"
  ip_number       = 400
  band_width      = 200
  cfw_log         = true
  cfw_log_storage = 1000
}