data "alicloud_ddoscoo_instances" "default" {
}

resource "alicloud_ddoscoo_domain_resource" "default" {
  domain = "tf-example172557516575085029.alibaba.com"
  real_servers = [
    "177.167.32.11",
    "177.167.32.12",
    "177.167.32.13",
    "177.167.32.14",
    "177.167.32.15"
  ]
  proxy_types {
    proxy_ports = [
      "443"
    ]
    proxy_type = "https"
  }

  instance_ids = [
    data.alicloud_ddoscoo_instances.default.ids.0
  ]
  rs_type = var.rs_type_var
}
