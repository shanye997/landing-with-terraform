data "alicloud_resource_manager_resource_groups" "update" {
  name_regex = "terraformci"
}

resource "alicloud_dcdn_domain" "default" {
  scope             = var.scope_var
  ssl_protocol      = var.ssl_protocol_var
  ssl_pub           = var.ssl_pub_var
  domain_name       = "tf-examplecn-hangzhou3107830.alicloud-provider.cn"
  resource_group_id = data.alicloud_resource_manager_resource_groups.update.ids.0
  tags = {
    Created = "TF_Update"
    For     = "Domain_Update"
  }
  sources {
    content  = "1.1.1.1"
    port     = "80"
    priority = "20"
    type     = "ipaddr"
    weight   = "10"
  }
  sources {
    content = "2.2.2.2"
    type    = "ipaddr"
  }

  ssl_pri = var.ssl_pri_var
  status  = var.status_var
}
