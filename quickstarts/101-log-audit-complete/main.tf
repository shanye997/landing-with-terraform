data "alicloud_account" "default" {}

resource "alicloud_log_audit" "foo" {
  variable_map = {

  }
  aliuid       = data.alicloud_account.default.id
  display_name = "tf-examplelogaudit-1864316"
  multi_account = [
    "1234567",
    "123123123213",
    "123141412"
  ]
}
