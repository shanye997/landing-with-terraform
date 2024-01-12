resource "alicloud_cdn_domain_new" "default" {
  scope       = "overseas"
  domain_name = "mycdndomain.alicloud-provider.cn"
  cdn_type    = "web"
  sources {
    type     = "ipaddr"
    content  = "1.1.3.1"
    priority = 20
    port     = 80
    weight   = 15
  }
}

resource "random_integer" "default" {
  max = 99999
  min = 10000
}

resource "alicloud_log_project" "default" {
  name        = "terraform-example-${random_integer.default.result}"
  description = "terraform-example"
}

resource "alicloud_log_store" "default" {
  project               = alicloud_log_project.default.name
  name                  = "example-store"
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

data "alicloud_regions" "default" {
  current = true
}

resource "alicloud_cdn_real_time_log_delivery" "default" {
  domain     = alicloud_cdn_domain_new.default.domain_name
  logstore   = alicloud_log_project.default.name
  project    = alicloud_log_store.default.name
  sls_region = data.alicloud_regions.default.regions.0.id
}