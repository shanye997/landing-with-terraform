<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cr_ee_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cr_ee_instance) | resource |
| [alicloud_eci_container_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eci_container_group) | resource |
| [alicloud_eip_address.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eip_address) | resource |
| [alicloud_security_group.group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_create_eip_var"></a> [auto\_create\_eip\_var](#input\_auto\_create\_eip\_var) | n/a | `string` | `"true"` | no |
| <a name="input_auto_match_image_cache_var"></a> [auto\_match\_image\_cache\_var](#input\_auto\_match\_image\_cache\_var) | n/a | `string` | `"true"` | no |
| <a name="input_cpu_var"></a> [cpu\_var](#input\_cpu\_var) | n/a | `string` | `"2"` | no |
| <a name="input_eip_bandwidth_var"></a> [eip\_bandwidth\_var](#input\_eip\_bandwidth\_var) | n/a | `string` | `"5"` | no |
| <a name="input_insecure_registry_var"></a> [insecure\_registry\_var](#input\_insecure\_registry\_var) | n/a | `string` | `"harbor.pre.com,192.168.1.1:5000,reg.test.com:80"` | no |
| <a name="input_memory_var"></a> [memory\_var](#input\_memory\_var) | n/a | `string` | `"4"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouAlicloudEciContainerGroup3704"` | no |
| <a name="input_plain_http_registry_var"></a> [plain\_http\_registry\_var](#input\_plain\_http\_registry\_var) | n/a | `string` | `"harbor.pre.com,192.168.1.1:5000,reg.test.com:80"` | no |
| <a name="input_restart_policy_var"></a> [restart\_policy\_var](#input\_restart\_policy\_var) | n/a | `string` | `"OnFailure"` | no |
<!-- END_TF_DOCS -->    