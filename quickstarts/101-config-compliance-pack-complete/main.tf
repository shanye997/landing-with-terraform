data "alicloud_config_compliance_packs" "example" {
}

data "alicloud_instances" "default" {}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_config_rule" "default" {
  count                      = 2
  rule_name                  = var.name
  description                = var.name
  source_identifier          = "ecs-instances-in-vpc"
  source_owner               = "ALIYUN"
  resource_types_scope       = ["ACS::ECS::Instance"]
  risk_level                 = 1
  config_rule_trigger_types  = "ConfigurationItemChangeNotification"
  tag_key_scope              = "tfTest"
  tag_value_scope            = "tfTest 123"
  resource_group_ids_scope   = data.alicloud_resource_manager_resource_groups.default.ids.0
  exclude_resource_ids_scope = data.alicloud_instances.default.instances[0].id
  region_ids_scope           = "cn-hangzhou"
  input_parameters = {
    vpcIds = data.alicloud_instances.default.instances[0].vpc_id
  }
}

resource "alicloud_config_compliance_pack" "default" {
  compliance_pack_template_id = data.alicloud_config_compliance_packs.example.packs.0.compliance_pack_template_id
  description                 = var.description_var
  risk_level                  = var.risk_level_var
  config_rule_ids {
    config_rule_id = alicloud_config_rule.default.0.id
  }
  config_rule_ids {
    config_rule_id = alicloud_config_rule.default.1.id
  }

  compliance_pack_name = var.compliance_pack_name_var
}
