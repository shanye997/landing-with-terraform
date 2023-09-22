resource "alicloud_cms_alarm_contact" "default" {
  alarm_contact_name = var.name
  channels_mail      = var.channels_mail_var
  describe           = var.describe_var
  lifecycle {
    ignore_changes = [
      "channels_mail"
    ]
  }

}
