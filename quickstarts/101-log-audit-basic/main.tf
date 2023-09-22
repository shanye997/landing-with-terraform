data "alicloud_account" "default" {}

resource "alicloud_log_audit" "foo" {
  display_name = "tf-examplelogaudit-1864316"
  aliuid       = data.alicloud_account.default.id
}
