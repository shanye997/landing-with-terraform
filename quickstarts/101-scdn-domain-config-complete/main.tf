resource "alicloud_scdn_domain" "default" {
  domain_name = var.name
  status      = "online"
  sources {
    content  = "1.1.1.1"
    type     = "ipaddr"
    priority = 20
    port     = 80
  }
}

resource "alicloud_scdn_domain_config" "default" {
  domain_name = alicloud_scdn_domain.default.domain_name
  function_args {
    arg_name  = "ttl"
    arg_value = "300"
  }
  function_args {
    arg_name  = "file_type"
    arg_value = "jpg"
  }
  function_args {
    arg_name  = "weight"
    arg_value = "1"
  }

  function_name = "filetype_based_ttl_set"
}
