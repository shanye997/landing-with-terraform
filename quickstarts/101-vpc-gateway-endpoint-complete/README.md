<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_vpc.defaultVpc](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vpc_gateway_endpoint.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc_gateway_endpoint) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | `"com.aliyun.cn-hangzhou.oss"` | no |
| <a name="input_gateway_endpoint_descrption_var"></a> [gateway\_endpoint\_descrption\_var](#input\_gateway\_endpoint\_descrption\_var) | n/a | `string` | `"test-gateway-endpoint"` | no |
| <a name="input_gateway_endpoint_name_var"></a> [gateway\_endpoint\_name\_var](#input\_gateway\_endpoint\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouvpcgatewayendpoint47398"` | no |
| <a name="input_policy_document_var"></a> [policy\_document\_var](#input\_policy\_document\_var) | n/a | `string` | `"{ \\\"Version\\\" : \\\"1\\\", \\\"Statement\\\" : [ { \\\"Effect\\\" : \\\"Allow\\\", \\\"Resource\\\" : [ \\\"*\\\" ], \\\"Action\\\" : [ \\\"*\\\" ], \\\"Principal\\\" : [ \\\"*\\\" ] } ] }"` | no |
<!-- END_TF_DOCS -->    