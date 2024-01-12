variable "name" {
  default = "terraform-example"
}


resource "alicloud_quotas_quota_alarm" "default" {
  quota_action_code = "q_desktop-count"
  quota_dimensions {
    key   = "regionId"
    value = "cn-hangzhou"
  }
  threshold_percent = 80
  product_code      = "gws"
  quota_alarm_name  = var.name
  threshold_type    = "used"
}