variable "domain_name" {
  default = "example.com"
}
data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_dcdn_ipa_domain" "example" {
  domain_name       = var.domain_name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  scope             = "global"
  status            = "online"
  sources {
    content  = "www.alicloud-provider.cn"
    port     = 80
    priority = "20"
    type     = "domain"
    weight   = 10
  }
}