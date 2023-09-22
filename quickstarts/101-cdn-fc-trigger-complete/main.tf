data "alicloud_account" "default" {}

data "alicloud_regions" "default" {
  current = true
}

resource "alicloud_cdn_fc_trigger" "default" {
  event_meta_name    = "LogFileCreated"
  event_meta_version = "1.0.0"
  notes              = "${var.name}"
  role_arn           = var.role_arn_var
  source_arn         = var.source_arn_var
  trigger_arn        = "acs:fc:${data.alicloud_regions.default.regions.0.id}:${data.alicloud_account.default.id}:services/FCTestService/functions/printEvent/triggers/testtrigger"
}
