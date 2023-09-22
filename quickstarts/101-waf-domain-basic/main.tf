data "alicloud_waf_instances" "default" {}

resource "alicloud_waf_domain" "domain" {
  instance_id       = data.alicloud_waf_instances.default.ids.0
  is_access_product = var.is_access_product_var
}
