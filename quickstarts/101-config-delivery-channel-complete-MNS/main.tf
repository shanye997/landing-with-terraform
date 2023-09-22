locals {
  uid      = data.alicloud_account.this.id
  role_arn = data.alicloud_ram_roles.this.roles.0.arn
  mns      = format("acs:mns:cn-hangzhou:%s:/topics/%s", local.uid, alicloud_mns_topic.default.name)
}

resource "alicloud_mns_topic" "default" {
  name = var.name
}

resource "alicloud_mns_topic" "change" {
  name = format("%s-change", var.name)
}

data "alicloud_account" "this" {}

data "alicloud_ram_roles" "this" {
  name_regex = "^AliyunServiceRoleForConfig$"
}

resource "alicloud_config_delivery_channel" "default" {
  delivery_channel_assume_role_arn = local.role_arn
  delivery_channel_condition       = var.delivery_channel_condition_var
  delivery_channel_name            = var.delivery_channel_name_var
  delivery_channel_target_arn      = local.mns
  delivery_channel_type            = "MNS"
  description                      = var.description_var
  status                           = var.status_var
}
