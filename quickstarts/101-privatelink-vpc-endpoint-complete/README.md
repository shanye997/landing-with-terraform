<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_privatelink_vpc_endpoint.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/privatelink_vpc_endpoint) | resource |
| [alicloud_privatelink_vpc_endpoint_service.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/privatelink_vpc_endpoint_service) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_security_group.default2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_endpoint_description_var"></a> [endpoint\_description\_var](#input\_endpoint\_description\_var) | n/a | `string` | `"Terraform Test Update"` | no |
| <a name="input_vpc_endpoint_name_var"></a> [vpc\_endpoint\_name\_var](#input\_vpc\_endpoint\_name\_var) | n/a | `string` | `"tf-example84336"` | no |
<!-- END_TF_DOCS -->    