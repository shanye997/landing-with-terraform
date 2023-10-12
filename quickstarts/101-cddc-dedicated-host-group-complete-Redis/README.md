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
| <a name="input_cpu_allocation_ratio_var"></a> [cpu\_allocation\_ratio\_var](#input\_cpu\_allocation\_ratio\_var) | n/a | `string` | `"102"` | no |
| <a name="input_dedicated_host_group_desc_var"></a> [dedicated\_host\_group\_desc\_var](#input\_dedicated\_host\_group\_desc\_var) | n/a | `string` | `"DedicatedHostGroupDescAll"` | no |
| <a name="input_disk_allocation_ratio_var"></a> [disk\_allocation\_ratio\_var](#input\_disk\_allocation\_ratio\_var) | n/a | `string` | `"111"` | no |
| <a name="input_host_replace_policy_var"></a> [host\_replace\_policy\_var](#input\_host\_replace\_policy\_var) | n/a | `string` | `"Auto"` | no |
| <a name="input_mem_allocation_ratio_var"></a> [mem\_allocation\_ratio\_var](#input\_mem\_allocation\_ratio\_var) | n/a | `string` | `"61"` | no |
<!-- END_TF_DOCS -->    