locals {
  uid      = data.alicloud_account.this.id
  role_arn = data.alicloud_ram_roles.this.roles.0.arn
  bucket   = format("acs:oss:cn-beijing:%s:ci-test-bucket-for-config", local.uid)
}

data "alicloud_account" "this" {}

data "alicloud_ram_roles" "this" {
  name_regex = "^AliyunServiceRoleForConfig$"
}

resource "alicloud_config_delivery_channel" "default" {
  delivery_channel_target_arn      = local.bucket
  delivery_channel_type            = "OSS"
  delivery_channel_assume_role_arn = local.role_arn
}
