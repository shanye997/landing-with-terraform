data "alicloud_kms_keys" "default" {
  status = "Enabled"
}

resource "alicloud_kms_key" "default" {
  count                  = length(data.alicloud_kms_keys.default.ids) > 0 ? 0 : 1
  description            = var.name
  status                 = "Enabled"
  pending_window_in_days = 7
}

locals {
  key_id = length(data.alicloud_kms_keys.default.ids) > 0 ? data.alicloud_kms_keys.default.ids.0 : concat(alicloud_kms_key.default.*.id, [""])[0]
}

data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_oos_secret_parameter" "default" {
  key_id                = local.key_id
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  secret_parameter_name = var.name
  tags = {
    Created = "tfexample"
    For     = "OosSecretParameter"
  }
  type        = "Secret"
  value       = var.value_var
  constraints = "{\"AllowedValues\":[\"tf-example-oos_secret_parameter\"], \"AllowedPattern\": \"tf-example-oos_secret_parameter\", \"MinLength\": 1, \"MaxLength\": 100}"
  description = var.name
}
