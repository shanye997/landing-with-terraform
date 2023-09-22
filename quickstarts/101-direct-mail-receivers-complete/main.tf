resource "alicloud_direct_mail_receivers" "default" {
  description     = "tf-example77462"
  receivers_alias = "tf-example77462@onaliyun.com"
  receivers_name  = var.name
}
