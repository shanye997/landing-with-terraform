<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automatic_rotation_var"></a> [automatic\_rotation\_var](#input\_automatic\_rotation\_var) | n/a | `string` | `"Enabled"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"from_terraform"` | no |
| <a name="input_pending_window_in_days_var"></a> [pending\_window\_in\_days\_var](#input\_pending\_window\_in\_days\_var) | n/a | `string` | `"7"` | no |
| <a name="input_rotation_interval_var"></a> [rotation\_interval\_var](#input\_rotation\_interval\_var) | n/a | `string` | `"2678400s"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Enabled"` | no |
<!-- END_TF_DOCS -->    