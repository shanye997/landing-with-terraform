<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block_var"></a> [cidr\_block\_var](#input\_cidr\_block\_var) | n/a | `string` | `"172.16.0.0/12"` | no |
| <a name="input_classic_link_enabled_var"></a> [classic\_link\_enabled\_var](#input\_classic\_link\_enabled\_var) | n/a | `string` | `"true"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhouVpc1039338"` | no |
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_enable_ipv6_var"></a> [enable\_ipv6\_var](#input\_enable\_ipv6\_var) | n/a | `string` | `"true"` | no |
| <a name="input_ipv6_isp_var"></a> [ipv6\_isp\_var](#input\_ipv6\_isp\_var) | n/a | `string` | `"BGP"` | no |
| <a name="input_vpc_name_var"></a> [vpc\_name\_var](#input\_vpc\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouVpc1039338"` | no |
<!-- END_TF_DOCS -->    