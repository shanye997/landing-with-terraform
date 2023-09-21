resource "alicloud_quotas_quota_application" "default" {
  quota_action_code = "vpc_whitelist/ha_vip_whitelist"
  reason            = "测试"
  product_code      = "vpc"
  desire_value      = "1"
}
