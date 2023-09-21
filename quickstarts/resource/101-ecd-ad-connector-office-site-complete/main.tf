resource "alicloud_cen_instance" "default" {
  cen_instance_name = "${var.name}"
  protection_level  = "REDUCED"
}

resource "alicloud_ecd_ad_connector_office_site" "default" {
  ad_connector_office_site_name = var.name
  desktop_access_type           = var.desktop_access_type_var
  domain_password               = var.domain_password_var
  cen_id                        = alicloud_cen_instance.default.id
  cidr_block                    = "10.0.0.0/12"
  enable_admin_access           = "true"
  bandwidth                     = "100"
  domain_user_name              = var.domain_user_name_var
  dns_address = [
    "127.0.0.2"
  ]
  domain_name            = var.domain_name_var
  sub_domain_name        = var.sub_domain_name_var
  enable_internet_access = "true"
  mfa_enabled            = var.mfa_enabled_var
  sub_domain_dns_address = [
    "127.0.0.3"
  ]
}
