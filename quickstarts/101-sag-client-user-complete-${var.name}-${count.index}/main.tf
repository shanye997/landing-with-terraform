resource "alicloud_sag_client_user" "default" {
  bandwidth = var.bandwidth_var
  count     = "10"
  password  = var.name
  sag_id    = ""
  user_mail = "${var.name}-${count.index}@test.com"
  user_name = "${var.name}-${count.index}"
}
