resource "alicloud_config_rule" "prerequirement-rule" {
  description                = "关联的资源类型下实体资源均已有指定标签，存在没有指定标签的资源则视为“不合规”。"
  source_owner               = "ALIYUN"
  source_identifier          = "required-tags"
  risk_level                 = 1
  tag_value_scope            = "test"
  tag_key_scope              = "test"
  exclude_resource_ids_scope = "test"
  region_ids_scope           = "cn-hangzhou"
  config_rule_trigger_types  = "ConfigurationItemChangeNotification"
  resource_group_ids_scope   = "rg-acfmvoh45rhcfly"
  resource_types_scope = [
  "ACS::RDS::DBInstance"]
  rule_name = "tf-cicd-rule-by-required-tags"
  input_parameters = {
    tag1Key   = "terraform"
    tag1Value = "terraform"
  }
}

resource "alicloud_config_remediation" "default" {
  config_rule_id          = alicloud_config_rule.prerequirement-rule.config_rule_id
  params                  = var.params_var
  remediation_type        = "OOS"
  remediation_template_id = var.remediation_template_id_var
  invoke_type             = var.invoke_type_var
}
