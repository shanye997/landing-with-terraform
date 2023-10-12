resource "alicloud_smartag_flow_log" "default" {
  status              = var.status_var
  output_type         = var.output_type_var
  inactive_aging      = var.inactive_aging_var
  sls_region_id       = var.sls_region_id_var
  netflow_server_ip   = var.netflow_server_ip_var
  netflow_version     = var.netflow_version_var
  logstore_name       = var.name
  description         = "${var.name}"
  flow_log_name       = "${var.name}"
  active_aging        = var.active_aging_var
  project_name        = var.name
  netflow_server_port = var.netflow_server_port_var
}
