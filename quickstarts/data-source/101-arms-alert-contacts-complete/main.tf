resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name     = var.name
  ding_robot_webhook_url = "https://oapi.dingtalk.com/robot/send?access_token=91f2f7"
  email                  = "hello.uuuu@aaa.com"
  phone_num              = "12345678901"
  system_noc             = "false"
}

data "alicloud_arms_alert_contacts" "default" {
  ids = [
    alicloud_arms_alert_contact.default.id
  ]
  name_regex         = alicloud_arms_alert_contact.default.alert_contact_name
  phone_num          = "${alicloud_arms_alert_contact.default.phone_num}00"
  alert_contact_name = "${alicloud_arms_alert_contact.default.alert_contact_name}_fake"
  email              = alicloud_arms_alert_contact.default.email
}
