resource "alicloud_arms_alert_contact" "default" {
  email                  = var.email_var
  phone_num              = var.phone_num_var
  system_noc             = var.system_noc_var
  alert_contact_name     = var.name
  ding_robot_webhook_url = var.ding_robot_webhook_url_var
}
