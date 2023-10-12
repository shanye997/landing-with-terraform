resource "alicloud_cms_alarm_contact" "default" {
  describe = var.describe_var
  lifecycle {
    ignore_changes = [
      "channels_mail"
    ]
  }

  alarm_contact_name = var.name
}
