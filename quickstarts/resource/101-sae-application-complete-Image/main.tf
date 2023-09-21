data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_sae_namespace" "default" {
  namespace_description = var.name
  namespace_id          = "cn-hangzhou:tfexample4918"
  namespace_name        = var.name
}

resource "alicloud_sae_application" "default" {
  php_arms_config_location         = var.php_arms_config_location_var
  envs                             = var.envs_var
  micro_registration               = var.micro_registration_var
  package_version                  = var.package_version_var
  memory                           = var.memory_var
  custom_host_alias                = var.custom_host_alias_var
  termination_grace_period_seconds = var.termination_grace_period_seconds_var
  namespace_id                     = alicloud_sae_namespace.default.namespace_id
  batch_wait_time                  = var.batch_wait_time_var
  tags = {
    Created = "tfexample7"
    For     = "Tfexample7"
  }
  vpc_id                               = data.alicloud_vpcs.default.ids.0
  cpu                                  = var.cpu_var
  status                               = var.status_var
  replicas                             = var.replicas_var
  liveness                             = var.liveness_var
  readiness                            = var.readiness_var
  post_start                           = var.post_start_var
  app_description                      = "tfexample4918desc"
  command_args                         = var.command_args_var
  min_ready_instances                  = var.min_ready_instances_var
  package_type                         = "Image"
  timezone                             = var.timezone_var
  app_name                             = "tfexample4918"
  sls_configs                          = var.sls_configs_var
  auto_enable_application_scaling_rule = var.auto_enable_application_scaling_rule_var
  edas_container_version               = var.edas_container_version_var
  command                              = var.command_var
  image_url                            = var.image_url_var
  vswitch_id                           = data.alicloud_vswitches.default.vswitches.0.id
  pre_stop                             = var.pre_stop_var
  php_config_location                  = var.php_config_location_var
  php_config                           = var.php_config_var
}
