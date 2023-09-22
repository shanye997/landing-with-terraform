data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  password            = var.password_var
  email               = var.email_var
  comment             = var.comment_var
  mobile              = var.mobile_var
  source_user_id      = "247823888127488180"
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  user_name           = "tf-exampleBastionhostUserRam-123456"
  mobile_country_code = var.mobile_country_code_var
  display_name        = var.display_name_var
  status              = var.status_var
  source              = "LDAP"
}
