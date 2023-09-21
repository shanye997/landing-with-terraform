provider "alicloud" {
  endpoints {
    bssopenapi = "business.aliyuncs.com"
  }
}

resource "alicloud_ddoscoo_instance" "default" {
  name              = "tf_example1187842"
  bandwidth         = "30"
  base_bandwidth    = "30"
  service_bandwidth = "100"
  port_count        = "50"
  domain_count      = "50"
}

data "alicloud_ddoscoo_instances" "default" {
  name_regex = "${alicloud_ddoscoo_instance.default.name}-fake"
  ids = [
    alicloud_ddoscoo_instance.default.id
  ]
}
