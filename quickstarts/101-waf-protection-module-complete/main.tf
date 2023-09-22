data "alicloud_waf_instances" "default" {}

resource "alicloud_waf_domain" "default" {
  domain_name       = ""
  instance_id       = data.alicloud_waf_instances.default.ids.0
  is_access_product = "On"
  source_ips        = ["1.1.1.1"]
  cluster_type      = "PhysicalCluster"
  http2_port        = [443]
  http_port         = [80]
  https_port        = [443]
  http_to_user_ip   = "Off"
  https_redirect    = "Off"
  load_balancing    = "IpHash"
  log_headers {
    key   = "foo"
    value = "http"
  }
}

resource "alicloud_waf_protection_module" "default" {
  status       = var.status_var
  defense_type = "ac_cc"
  domain       = alicloud_waf_domain.default.domain_name
  instance_id  = data.alicloud_waf_instances.default.ids.0
  mode         = var.mode_var
}
