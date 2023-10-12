resource "alicloud_api_gateway_log_config" "default" {
  log_type      = "PROVIDER"
  sls_log_store = var.sls_log_store_var
  sls_project   = var.sls_project_var
}
