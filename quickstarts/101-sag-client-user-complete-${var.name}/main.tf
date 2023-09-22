resource "alicloud_sag_client_user" "default" {
  user_mail = "${var.name}@test.com"
  user_name = var.name
  bandwidth = var.bandwidth_var
  password  = var.name
  sag_id    = ""
}
