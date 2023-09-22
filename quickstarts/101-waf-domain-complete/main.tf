data "alicloud_resource_manager_resource_groups" "default" {
  name_regex = "^default$"
}

data "alicloud_waf_instances" "default" {}

resource "alicloud_waf_domain" "domain" {
  read_time = var.read_time_var
  https_port = [
    "443"
  ]
  load_balancing    = var.load_balancing_var
  instance_id       = data.alicloud_waf_instances.default.ids.0
  is_access_product = var.is_access_product_var
  cluster_type      = var.cluster_type_var
  https_redirect    = var.https_redirect_var
  connection_time   = var.connection_time_var
  source_ips = [
    "1.1.1.1"
  ]
  write_time      = var.write_time_var
  http_to_user_ip = var.http_to_user_ip_var
  http2_port = [
    "8443"
  ]
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  http_port = [
    "80"
  ]
  log_headers {
    key   = "kkk1"
    value = "vvv1"
  }
  log_headers {
    value = "Sdd2"
    key   = "Test2"
  }

}
