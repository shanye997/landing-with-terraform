resource "alicloud_cms_alarm_contact_group" "default" {
  alarm_contact_group_name = var.name
}

resource "alicloud_cms_alarm_contact_group" "default1" {
  alarm_contact_group_name = "${var.name}_update"
}

resource "alicloud_resource_manager_resource_group" "default" {
  resource_group_name = var.name
  display_name        = var.name
}

resource "alicloud_cms_monitor_group" "default" {
  contact_groups = [
    alicloud_cms_alarm_contact_group.default.alarm_contact_group_name,
    alicloud_cms_alarm_contact_group.default1.alarm_contact_group_name
  ]
  monitor_group_name = var.name
  tags = {
    Created = "TF"
    For     = "acceptance-test"
  }
  resource_group_id   = alicloud_resource_manager_resource_group.default.id
  resource_group_name = alicloud_resource_manager_resource_group.default.resource_group_name
}
