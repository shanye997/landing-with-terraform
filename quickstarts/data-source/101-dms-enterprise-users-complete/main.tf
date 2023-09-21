resource "alicloud_ram_user" "user" {
  name         = "tf_exampleDmsEnterpriseUsersDataSource_1361968"
  display_name = "user_display_name"
  mobile       = "86-18688888888"
  email        = "hello.uuu@aaa.com"
  comments     = "yoyoyo"
}

resource "alicloud_dms_enterprise_user" "default" {
  uid        = alicloud_ram_user.user.id
  user_name  = "tf_exampleDmsEnterpriseUsersDataSource_1361968"
  mobile     = "15910799999"
  role_names = ["DBA"]
}

data "alicloud_dms_enterprise_users" "default" {
  ids = [
    "${alicloud_dms_enterprise_user.default.uid}-fake"
  ]
  role       = "DBA"
  name_regex = alicloud_dms_enterprise_user.default.user_name
  status     = "NORMAL"
}
