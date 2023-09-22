resource "alicloud_ddoscoo_instance" "default" {
  bandwidth         = var.bandwidth_var
  base_bandwidth    = var.base_bandwidth_var
  domain_count      = var.domain_count_var
  name              = var.name_var
  port_count        = var.port_count_var
  product_type      = var.product_type_var
  service_bandwidth = var.service_bandwidth_var
}
