data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "default"
}

resource "alicloud_dcdn_ipa_domain" "default" {
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  scope             = "global"
  sources {
    content  = "www.alicloud-provider.cn"
    port     = "8898"
    priority = "20"
    type     = "domain"
    weight   = "10"
  }

  status      = var.status_var
  domain_name = var.domain_name
}
