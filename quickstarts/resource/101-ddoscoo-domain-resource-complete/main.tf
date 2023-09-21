data "alicloud_ddoscoo_instances" "default" {
}

resource "alicloud_ddoscoo_domain_resource" "default" {
  rs_type   = var.rs_type_var
  domain    = "tf-example172557516575085029.alibaba.com"
  https_ext = var.https_ext_var
  instance_ids = [
    data.alicloud_ddoscoo_instances.default.ids.0
  ]
  ocsp_enabled = var.ocsp_enabled_var
  proxy_types {
    proxy_ports = [
      "443"
    ]
    proxy_type = "https"
  }

  real_servers = [
    "177.167.32.11",
    "177.167.32.12",
    "177.167.32.13",
    "177.167.32.14",
    "177.167.32.15"
  ]
}
