resource "alicloud_arms_alert_contact" "default" {
  alert_contact_name = var.name
  email              = "${var.name}@aaa.com"
}

resource "alicloud_arms_alert_contact_group" "default" {
  alert_contact_group_name = var.name
  contact_ids              = [alicloud_arms_alert_contact.default.id]
}

data "alicloud_arms_alert_contact_groups" "default" {
  contact_name = alicloud_arms_alert_contact.default.alert_contact_name
  ids = [
    alicloud_arms_alert_contact_group.default.id
  ]
  name_regex               = alicloud_arms_alert_contact_group.default.alert_contact_group_name
  alert_contact_group_name = alicloud_arms_alert_contact_group.default.alert_contact_group_name
  contact_id               = alicloud_arms_alert_contact.default.id
}
