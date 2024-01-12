resource "alicloud_cloud_firewall_instance" "example" {
  payment_type    = "Subscription"
  spec            = "premium_version"
  ip_number       = 20
  band_width      = 10
  cfw_log         = true
  cfw_log_storage = 1000
  period          = 1
}