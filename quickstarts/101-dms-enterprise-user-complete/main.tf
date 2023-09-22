resource "alicloud_ram_user" "user" {
  name         = "tf-exampleDmsEnterpriseUser7920992"
  display_name = "user_display_name"
  mobile       = "86-18688888888"
  email        = "hello.uuu@aaa.com"
  comments     = "yoyoyo"
}

resource "alicloud_dms_enterprise_user" "default" {
  role_names = [
    "DBA"
  ]
  status            = var.status_var
  uid               = alicloud_ram_user.user.id
  max_execute_count = var.max_execute_count_var
  max_result_count  = var.max_result_count_var
}
