resource "alicloud_pvtz_user_vpc_authorization" "default" {
  auth_type          = "NORMAL"
  authorized_user_id = "1359528198477648"
  auth_channel       = var.auth_channel_var
}
