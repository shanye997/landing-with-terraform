data "alicloud_instances" "default" {
  name_regex = "no-deleteing-hbr-ecs-backup-plan"
  status     = "Running"
}

resource "alicloud_hbr_ecs_backup_client" "default" {
  data_proxy_setting = var.data_proxy_setting_var
  max_worker         = var.max_worker_var
  proxy_user         = var.proxy_user_var
  proxy_password     = var.proxy_password_var
  status             = var.status_var
  max_cpu_core       = var.max_cpu_core_var
  instance_id        = data.alicloud_instances.default.instances.0.id
  proxy_port         = var.proxy_port_var
  use_https          = var.use_https_var
  data_network_type  = var.data_network_type_var
  proxy_host         = var.proxy_host_var
}
