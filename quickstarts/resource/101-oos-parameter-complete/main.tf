data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_oos_parameter" "default" {
  value             = var.value_var
  description       = "${var.name}"
  parameter_name    = var.name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  constraints       = "{\"AllowedValues\":[\"tf-example-oos_parameter\"], \"AllowedPattern\": \"tf-example-oos_parameter\", \"MinLength\": 1, \"MaxLength\": 100}"
  tags = {
    Created = "tfexample1"
    For     = "OosParameter1"
  }
  type = "String"
}
