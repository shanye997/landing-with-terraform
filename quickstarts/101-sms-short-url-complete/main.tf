resource "alicloud_sms_short_url" "default" {
  effective_days = "30"
  short_url_name = var.name
  source_url     = var.source_url
}
