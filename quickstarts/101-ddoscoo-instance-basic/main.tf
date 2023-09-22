resource "alicloud_ddoscoo_instance" "default" {
  port_count        = var.port_count_var
  domain_count      = var.domain_count_var
  base_bandwidth    = var.base_bandwidth_var
  service_bandwidth = var.service_bandwidth_var
  name              = var.name_var
  bandwidth         = var.bandwidth_var
}
