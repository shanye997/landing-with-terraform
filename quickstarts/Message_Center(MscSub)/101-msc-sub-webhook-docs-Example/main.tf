variable "name" {
  default = "tfexample"
}
variable "token" {
  default = "abcd****"
}
resource "alicloud_msc_sub_webhook" "example" {
  server_url   = format("https://oapi.dingtalk.com/robot/send?access_token=%s", var.token)
  webhook_name = var.name
}