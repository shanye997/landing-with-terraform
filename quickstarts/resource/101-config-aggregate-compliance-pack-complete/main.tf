data "alicloud_config_aggregators" "default" {}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_instances" "default" {}

resource "alicloud_config_aggregate_config_rule" "default" {
  count                      = 2
  aggregator_id              = data.alicloud_config_aggregators.default.ids.0
  aggregate_config_rule_name = var.name
  source_owner               = "ALIYUN"
  source_identifier          = "ecs-cpu-min-count-limit"
  config_rule_trigger_types  = "ConfigurationItemChangeNotification"
  resource_types_scope       = ["ACS::ECS::Instance"]
  risk_level                 = 1
  description                = var.name
  exclude_resource_ids_scope = data.alicloud_instances.default.ids.0
  input_parameters = {
    cpuCount = "4",
  }
  region_ids_scope         = "cn-hangzhou"
  resource_group_ids_scope = data.alicloud_resource_manager_resource_groups.default.ids.0
  tag_key_scope            = "tFTest"
  tag_value_scope          = "forTF 123"
}

resource "alicloud_config_aggregate_compliance_pack" "default" {
  risk_level = var.risk_level_var
  config_rule_ids {
    config_rule_id = alicloud_config_aggregate_config_rule.default.0.config_rule_id
  }
  config_rule_ids {
    config_rule_id = alicloud_config_aggregate_config_rule.default.1.config_rule_id
  }

  aggregate_compliance_pack_name = var.aggregate_compliance_pack_name_var
  aggregator_id                  = data.alicloud_config_aggregators.default.ids.0
  compliance_pack_template_id    = "ct-3d20ff4e06a30027f76e"
  description                    = var.description_var
}
