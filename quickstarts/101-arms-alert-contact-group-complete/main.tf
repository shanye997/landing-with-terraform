resource "alicloud_arms_alert_contact" "default" {
  count              = 2
  alert_contact_name = "${var.name}-${count.index}"
  email              = "${var.name}-${count.index}@aaa.com"
}

resource "alicloud_arms_alert_contact_group" "default" {
  contact_ids = [
    alicloud_arms_alert_contact.default.0.id,
    alicloud_arms_alert_contact.default.1.id
  ]
  alert_contact_group_name = var.name
}
