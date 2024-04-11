variable "account_name" {
  default = "tfexample"
}
variable "domain_name" {
  default = "alicloud-provider.online"
}
provider "alicloud" {
  region = "cn-hangzhou"
}

resource "alicloud_direct_mail_domain" "example" {
  domain_name = var.domain_name
}
resource "alicloud_direct_mail_mail_address" "example" {
  account_name = format("%s@%s", var.account_name, alicloud_direct_mail_domain.example.domain_name)
  sendtype     = "batch"
}