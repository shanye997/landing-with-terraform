resource "alicloud_config_rule" "default" {
  rule_name         = "tf-exampleConfigRule7879870"
  source_owner      = "ALIYUN"
  source_identifier = "ecs-instances-in-vpc"
  risk_level        = var.risk_level_var
}
