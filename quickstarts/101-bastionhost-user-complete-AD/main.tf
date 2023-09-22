data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  password            = var.password_var
  status              = var.status_var
  mobile_country_code = var.mobile_country_code_var
  display_name        = var.display_name_var
  source              = "AD"
  user_name           = "tf-exampleBastionhostUserRam-123456"
  source_user_id      = "247823888127488180"
  comment             = var.comment_var
  email               = var.email_var
  mobile              = var.mobile_var
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
}
