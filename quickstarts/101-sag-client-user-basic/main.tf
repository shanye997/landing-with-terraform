resource "alicloud_sag_client_user" "default" {
  count     = "10"
  bandwidth = var.bandwidth_var
  user_mail = "${var.name}-${count.index}@test.com"
  sag_id    = ""
}
