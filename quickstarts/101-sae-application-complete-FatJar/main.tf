data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = "cn-hangzhou:tfexample85736"
  namespace_name        = var.name
}

resource "alicloud_sae_application" "default" {
  readiness                            = var.readiness_var
  php_config_location                  = var.php_config_location_var
  status                               = var.status_var
  jdk                                  = var.jdk_var
  sls_configs                          = var.sls_configs_var
  vpc_id                               = data.alicloud_vpcs.default.ids.0
  auto_enable_application_scaling_rule = var.auto_enable_application_scaling_rule_var
  php_config                           = var.php_config_var
  min_ready_instances                  = var.min_ready_instances_var
  command                              = var.command_var
  timezone                             = var.timezone_var
  cpu                                  = var.cpu_var
  app_name                             = "tfexample85736"
  termination_grace_period_seconds     = var.termination_grace_period_seconds_var
  package_version                      = var.package_version_var
  vswitch_id                           = data.alicloud_vswitches.default.vswitches.0.id
  command_args                         = var.command_args_var
  batch_wait_time                      = var.batch_wait_time_var
  app_description                      = "tfexample85736desc"
  namespace_id                         = alicloud_sae_namespace.default.namespace_id
  package_url                          = var.package_url_var
  replicas                             = var.replicas_var
  pre_stop                             = var.pre_stop_var
  envs                                 = var.envs_var
  memory                               = var.memory_var
  php_arms_config_location             = var.php_arms_config_location_var
  custom_host_alias                    = var.custom_host_alias_var
  package_type                         = "FatJar"
  post_start                           = var.post_start_var
  liveness                             = var.liveness_var
}
