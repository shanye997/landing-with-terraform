resource "alicloud_dcdn_domain" "default" {
  domain_name = var.name
  scope       = "overseas"
  status      = "online"
  sources {
    content  = "1.1.1.1"
    type     = "ipaddr"
    priority = 20
    port     = 80
    weight   = 10
  }
}

resource "alicloud_dcdn_domain_config" "default" {
  domain_name = alicloud_dcdn_domain.default.domain_name
  function_args {
    arg_name  = "refer_domain_allow_list"
    arg_value = "110.110.110.110"
  }

  function_name = "referer_white_list_set"
}
