resource "alicloud_ecd_simple_office_site" "default" {
  enable_cross_desktop_access = var.enable_cross_desktop_access_var
  mfa_enabled                 = var.mfa_enabled_var
  office_site_name            = var.office_site_name_var
  sso_enabled                 = var.sso_enabled_var
  cidr_block                  = "172.16.0.0/12"
  desktop_access_type         = var.desktop_access_type_var
  enable_admin_access         = "true"
}
