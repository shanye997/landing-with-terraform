resource "alicloud_cms_alarm_contact" "default" {
  alarm_contact_name = "${var.name}-1"
  describe           = "For Test 1234567"
  channels_mail      = "hello.uuuu@aaa.com"
  lifecycle {
    ignore_changes = [channels_mail]
  }
}

resource "alicloud_cms_alarm_contact" "default0" {
  alarm_contact_name = "${var.name}-0"
  describe           = "For Test 1234567"
  channels_mail      = "hello.uuuu@aaa.com"
  lifecycle {
    ignore_changes = [channels_mail]
  }
}

resource "alicloud_cms_alarm_contact_group" "default" {
  alarm_contact_group_name = var.name
  contacts = [
    alicloud_cms_alarm_contact.default.id,
    alicloud_cms_alarm_contact.default0.id
  ]
  describe          = var.describe_var
  enable_subscribed = var.enable_subscribed_var
}
