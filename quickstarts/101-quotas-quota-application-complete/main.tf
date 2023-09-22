resource "alicloud_quotas_quota_application" "default" {
  product_code      = "vpc"
  quota_category    = "WhiteListLabel"
  audit_mode        = "Sync"
  env_language      = "zh"
  expire_time       = "2023-06-26T16:00:00Z"
  notice_type       = "3"
  quota_action_code = "vpc_whitelist/ha_vip_whitelist"
  reason            = "测试"
  desire_value      = "1"
  effective_time    = "2023-05-22T16:00:00Z"
}
