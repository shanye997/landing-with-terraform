data "alicloud_bastionhost_instances" "default" {}

resource "alicloud_bastionhost_user" "default" {
  instance_id         = data.alicloud_bastionhost_instances.default.ids.0
  source              = "Local"
  display_name        = var.display_name_var
  mobile_country_code = var.mobile_country_code_var
  password            = var.password_var
  comment             = var.comment_var
  user_name           = "tf-exampleBastionHostUser-12345"
  email               = var.email_var
  status              = var.status_var
  mobile              = var.mobile_var
}
