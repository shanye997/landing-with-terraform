variable "domain_name" {
  default = "alicloud-provider.online"
}
provider "alicloud" {
  region = "cn-hangzhou"
}
resource "alicloud_direct_mail_domain" "example" {
  domain_name = var.domain_name
}