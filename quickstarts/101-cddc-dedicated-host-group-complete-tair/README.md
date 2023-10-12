<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cddc_dedicated_host_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cddc_dedicated_host_group) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_policy_var"></a> [allocation\_policy\_var](#input\_allocation\_policy\_var) | n/a | `string` | `"Evenly"` | no |
| <a name="input_dedicated_host_group_desc_var"></a> [dedicated\_host\_group\_desc\_var](#input\_dedicated\_host\_group\_desc\_var) | n/a | `string` | `"tf-examplecn-hangzhoucddcdedicatedhostgroup44753"` | no |
| <a name="input_host_replace_policy_var"></a> [host\_replace\_policy\_var](#input\_host\_replace\_policy\_var) | n/a | `string` | `"Auto"` | no |
<!-- END_TF_DOCS -->    