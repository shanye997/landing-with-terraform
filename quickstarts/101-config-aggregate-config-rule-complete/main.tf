data "alicloud_instances" "default" {}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_config_aggregators" "default" {}

resource "alicloud_config_aggregate_config_rule" "default" {
  aggregate_config_rule_name = var.name
  aggregator_id              = data.alicloud_config_aggregators.default.ids.0
  input_parameters = {

  }
  risk_level                 = var.risk_level_var
  source_identifier          = "ecs-cpu-min-count-limit"
  tag_value_scope            = var.tag_value_scope_var
  config_rule_trigger_types  = var.config_rule_trigger_types_var
  resource_group_ids_scope   = data.alicloud_resource_manager_resource_groups.default.ids.1
  status                     = var.status_var
  description                = var.description_var
  source_owner               = "ALIYUN"
  tag_key_scope              = var.tag_key_scope_var
  exclude_resource_ids_scope = data.alicloud_instances.default.ids.1
  resource_types_scope = [
    "ACS::ECS::Instance"
  ]
  region_ids_scope = var.region_ids_scope_var
}
