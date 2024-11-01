resource "random_integer" "default" {
  min = 10000
  max = 99999
}

# 添加一个加速域名
resource "alicloud_dcdn_domain" "domain" {
  domain_name = "mydcdndomain-${random_integer.default.result}.alicloud-provider.cn"
  scope       = "overseas"
  sources {
    content  = "myoss-${random_integer.default.result}.oss-rg-china-mainland.aliyuncs.com"
    type     = "oss"
    priority = "20"
    port     = 80
    weight   = "15"
  }
}

// # 为加速域名配置访问IP白名单
resource "alicloud_dcdn_domain_config" "config-ip" {
  domain_name   = alicloud_dcdn_domain.domain.domain_name
  function_name = "ip_allow_list_set"
  function_args {
    arg_name  = "ip_list"
    arg_value = "192.168.0.1"
  }
}