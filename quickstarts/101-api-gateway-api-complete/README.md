<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_api_gateway_api.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/api_gateway_api) | resource |
| [alicloud_api_gateway_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/api_gateway_group) | resource |
| [alicloud_api_gateway_vpc_access.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/api_gateway_vpc_access) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auth_type_var"></a> [auth\_type\_var](#input\_auth\_type\_var) | n/a | `string` | `"APP"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf_example_api description"` | no |
| <a name="input_force_nonce_check_var"></a> [force\_nonce\_check\_var](#input\_force\_nonce\_check\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_exampleApiGatewayApi_1882611"` | no |
| <a name="input_service_type_var"></a> [service\_type\_var](#input\_service\_type\_var) | n/a | `string` | `"HTTP-VPC"` | no |
<!-- END_TF_DOCS -->    