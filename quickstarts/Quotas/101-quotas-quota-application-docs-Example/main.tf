variable "name" {
  default = "terraform-example"
}


resource "alicloud_quotas_quota_application" "default" {
  quota_action_code = "q_desktop-count"
  product_code      = "gws"
  quota_category    = "CommonQuota"
  notice_type       = 3
  dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }
  desire_value = 1001
  reason       = "测试"
  env_language = "zh"
}