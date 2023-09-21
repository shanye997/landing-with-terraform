resource "alicloud_ecs_deployment_set" "default" {
  deployment_set_name                   = var.deployment_set_name_var
  description                           = var.description_var
  domain                                = "Default"
  granularity                           = "Host"
  on_unable_to_redeploy_failed_instance = var.on_unable_to_redeploy_failed_instance_var
  strategy                              = "Availability"
}
