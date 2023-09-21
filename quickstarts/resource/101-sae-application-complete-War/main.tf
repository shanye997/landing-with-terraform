data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = "cn-hangzhou:tfexample37596"
  namespace_name        = var.name
}

resource "alicloud_sae_application" "default" {
  readiness                            = var.readiness_var
  pre_stop                             = var.pre_stop_var
  post_start                           = var.post_start_var
  web_container                        = var.web_container_var
  package_type                         = "War"
  vswitch_id                           = data.alicloud_vswitches.default.vswitches.0.id
  vpc_id                               = data.alicloud_vpcs.default.ids.0
  replicas                             = var.replicas_var
  liveness                             = var.liveness_var
  package_version                      = var.package_version_var
  namespace_id                         = alicloud_sae_namespace.default.namespace_id
  app_name                             = "tfexample37596"
  cpu                                  = var.cpu_var
  timezone                             = var.timezone_var
  app_description                      = "tfexample37596desc"
  php_config_location                  = var.php_config_location_var
  envs                                 = var.envs_var
  batch_wait_time                      = var.batch_wait_time_var
  auto_enable_application_scaling_rule = var.auto_enable_application_scaling_rule_var
  memory                               = var.memory_var
  command_args                         = var.command_args_var
  termination_grace_period_seconds     = var.termination_grace_period_seconds_var
  sls_configs                          = var.sls_configs_var
  custom_host_alias                    = var.custom_host_alias_var
  min_ready_instances                  = var.min_ready_instances_var
  php_arms_config_location             = var.php_arms_config_location_var
  package_url                          = var.package_url_var
  php_config                           = var.php_config_var
  jdk                                  = var.jdk_var
  status                               = var.status_var
  command                              = var.command_var
}
