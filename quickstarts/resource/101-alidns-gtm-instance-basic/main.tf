resource "alicloud_alidns_gtm_instance" "default" {
  period                  = var.period_var
  instance_name           = var.instance_name_var
  sms_notification_count  = "1000"
  health_check_task_count = "100"
  payment_type            = "Subscription"
  package_edition         = "ultimate"
}
