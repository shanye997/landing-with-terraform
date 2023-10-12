<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_serverless_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_serverless_kubernetes) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"false"` | no |
| <a name="input_enable_rrsa_var"></a> [enable\_rrsa\_var](#input\_enable\_rrsa\_var) | n/a | `string` | `"true"` | no |
| <a name="input_load_balancer_spec_var"></a> [load\_balancer\_spec\_var](#input\_load\_balancer\_spec\_var) | n/a | `string` | `"slb.s2.small"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleserverlesskubernetes-6275992"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleserverlesskubernetes-6275992"` | no |
<!-- END_TF_DOCS -->    