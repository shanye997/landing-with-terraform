locals {
  uid      = data.alicloud_account.this.id
  role_arn = data.alicloud_ram_roles.this.roles.0.arn
  sls      = format("acs:log:cn-hangzhou:%s:project/%s/logstore/%s", local.uid, alicloud_log_project.this.name, alicloud_log_store.this.name)
}

resource "alicloud_log_project" "this" {
  name = var.name
}

resource "alicloud_log_store" "this" {
  name    = var.name
  project = alicloud_log_project.this.name
}

resource "alicloud_log_store" "change" {
  name    = format("%s-change", var.name)
  project = alicloud_log_project.this.name
}

data "alicloud_account" "this" {}

data "alicloud_ram_roles" "this" {
  name_regex = "^AliyunServiceRoleForConfig$"
}

resource "alicloud_config_delivery_channel" "default" {
  delivery_channel_name            = var.delivery_channel_name_var
  delivery_channel_target_arn      = local.sls
  delivery_channel_type            = "SLS"
  description                      = var.description_var
  status                           = var.status_var
  delivery_channel_assume_role_arn = local.role_arn
}
