resource "alicloud_cloud_firewall_instance" "Subscription" {
  payment_type = "Subscription"
  spec         = "premium_version"
  ip_number    = 20
  band_width   = 10
  cfw_log      = false
  period       = 1
}