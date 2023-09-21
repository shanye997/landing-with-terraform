resource "alicloud_cdn_domain_new" "default" {
  domain_name = "tf-examplecn-hangzhoucdnrealtimelogdelivery63219.example.com"
  cdn_type    = "web"
  scope       = "overseas"
  sources {
    content  = "www.aliyuntest.com"
    type     = "domain"
    priority = 20
    port     = 80
    weight   = 10
  }
}

resource "alicloud_log_project" "default" {
  name        = var.name
  description = "created by terraform"
}

resource "alicloud_log_store" "default" {
  project               = alicloud_log_project.default.name
  name                  = var.name
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "alicloud_cdn_real_time_log_delivery" "default" {
  project    = alicloud_log_project.default.name
  sls_region = "cn-hangzhou"
  domain     = alicloud_cdn_domain_new.default.domain_name
  logstore   = alicloud_log_store.default.name
}
