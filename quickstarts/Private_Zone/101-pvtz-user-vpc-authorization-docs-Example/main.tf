variable "authorized_user_id" {
  default = 123456789
}
resource "alicloud_pvtz_user_vpc_authorization" "example" {
  authorized_user_id = var.authorized_user_id
  auth_channel       = "RESOURCE_DIRECTORY"
}