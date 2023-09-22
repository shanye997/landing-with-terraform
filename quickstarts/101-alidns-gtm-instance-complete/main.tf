data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_cms_alarm_contact_group" "default" {
  count                    = 2
  alarm_contact_group_name = join("-", [var.name, count.index])
}

resource "alicloud_alidns_gtm_instance" "default" {
  public_cname_mode = var.public_cname_mode_var
  period            = var.period_var
  alert_config {
    dingtalk_notice = "true"
    email_notice    = "true"
    notice_type     = "ADDR_ALERT"
    sms_notice      = "true"
  }

  renewal_status          = "ManualRenewal"
  payment_type            = "Subscription"
  cname_type              = var.cname_type_var
  resource_group_id       = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  instance_name           = var.instance_name_var
  health_check_task_count = "100"
  ttl                     = var.ttl_var
  sms_notification_count  = "1000"
  public_user_domain_name = var.domain_name
  strategy_mode           = var.strategy_mode_var
  alert_group = [
    alicloud_cms_alarm_contact_group.default.0.alarm_contact_group_name
  ]
  package_edition = "ultimate"
}
