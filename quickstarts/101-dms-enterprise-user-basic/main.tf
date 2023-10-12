resource "alicloud_ram_user" "user" {
  name         = "tf-exampleDmsEnterpriseUser7920992"
  display_name = "user_display_name"
  mobile       = "86-18688888888"
  email        = "hello.uuu@aaa.com"
  comments     = "yoyoyo"
}

resource "alicloud_dms_enterprise_user" "default" {
  uid = alicloud_ram_user.user.id
}
