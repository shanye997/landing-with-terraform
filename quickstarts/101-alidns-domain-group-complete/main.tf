resource "alicloud_alidns_domain_group" "default" {
  domain_group_name = var.domain_group_name_var
  lang              = var.lang_var
}
