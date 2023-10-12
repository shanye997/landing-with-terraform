<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_kms_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_instance) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_num_var"></a> [key\_num\_var](#input\_key\_num\_var) | n/a | `string` | `"2000"` | no |
| <a name="input_secret_num_var"></a> [secret\_num\_var](#input\_secret\_num\_var) | n/a | `string` | `"1000"` | no |
| <a name="input_spec_var"></a> [spec\_var](#input\_spec\_var) | n/a | `string` | `"2000"` | no |
| <a name="input_vpc_num_var"></a> [vpc\_num\_var](#input\_vpc\_num\_var) | n/a | `string` | `"7"` | no |
<!-- END_TF_DOCS -->    