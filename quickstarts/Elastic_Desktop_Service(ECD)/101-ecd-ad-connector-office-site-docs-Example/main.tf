variable "name" {
  default = "terraform-example"
}

resource "alicloud_cen_instance" "default" {
  cen_instance_name = var.name
  protection_level  = "REDUCED"
}

resource "alicloud_ecd_ad_connector_office_site" "default" {
  ad_connector_office_site_name = var.name
  bandwidth                     = 100
  cen_id                        = alicloud_cen_instance.default.id
  cidr_block                    = "10.0.0.0/12"
  desktop_access_type           = "INTERNET"
  dns_address                   = ["127.0.0.2"]
  domain_name                   = "corp.example.com"
  domain_password               = "Example1234"
  domain_user_name              = "sAMAccountName"
  enable_admin_access           = false
  enable_internet_access        = false
  mfa_enabled                   = false
  sub_domain_dns_address        = ["127.0.0.3"]
  sub_domain_name               = "child.example.com"
}