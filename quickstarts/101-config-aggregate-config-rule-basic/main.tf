data "alicloud_config_aggregators" "default" {}

resource "alicloud_config_aggregate_config_rule" "default" {
  aggregator_id             = data.alicloud_config_aggregators.default.ids.0
  source_owner              = "ALIYUN"
  config_rule_trigger_types = var.config_rule_trigger_types_var
  source_identifier         = "ecs-cpu-min-count-limit"
  resource_types_scope = [
    "ACS::ECS::Instance"
  ]
  aggregate_config_rule_name = var.name
  risk_level                 = var.risk_level_var
}
