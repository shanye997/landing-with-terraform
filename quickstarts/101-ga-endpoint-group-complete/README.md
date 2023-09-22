<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_eip_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eip_address) | resource |
| [alicloud_ga_bandwidth_package.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_bandwidth_package) | resource |
| [alicloud_ga_bandwidth_package_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_bandwidth_package_attachment) | resource |
| [alicloud_ga_endpoint_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_endpoint_group) | resource |
| [alicloud_ga_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_listener) | resource |
| [alicloud_ga_accelerators.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ga_accelerators) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"EndpointGroup"` | no |
| <a name="input_endpoint_request_protocol_var"></a> [endpoint\_request\_protocol\_var](#input\_endpoint\_request\_protocol\_var) | n/a | `string` | `"HTTP"` | no |
| <a name="input_health_check_interval_seconds_var"></a> [health\_check\_interval\_seconds\_var](#input\_health\_check\_interval\_seconds\_var) | n/a | `string` | `"3"` | no |
| <a name="input_health_check_path_var"></a> [health\_check\_path\_var](#input\_health\_check\_path\_var) | n/a | `string` | `"/healthcheck"` | no |
| <a name="input_health_check_port_var"></a> [health\_check\_port\_var](#input\_health\_check\_port\_var) | n/a | `string` | `"20"` | no |
| <a name="input_health_check_protocol_var"></a> [health\_check\_protocol\_var](#input\_health\_check\_protocol\_var) | n/a | `string` | `"tcp"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouAliCloudGaEndpointGroup2726"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhouAliCloudGaEndpointGroup7944"` | no |
| <a name="input_threshold_count_var"></a> [threshold\_count\_var](#input\_threshold\_count\_var) | n/a | `string` | `"3"` | no |
| <a name="input_traffic_percentage_var"></a> [traffic\_percentage\_var](#input\_traffic\_percentage\_var) | n/a | `string` | `"20"` | no |
<!-- END_TF_DOCS -->    