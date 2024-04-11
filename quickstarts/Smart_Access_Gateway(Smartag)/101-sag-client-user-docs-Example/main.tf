variable "name" {
  default = "tf-example"
}
variable "sag_id" {
  default = "sag-9bifkfaz4fg***"
}
provider "alicloud" {
  region = "cn-shanghai"
}

resource "alicloud_sag_client_user" "default" {
  sag_id    = var.sag_id
  bandwidth = "20"
  user_mail = "tf-example@abc.com"
  user_name = var.name
  password  = "example1234"
  client_ip = "192.1.10.0"
}