<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_eci_virtual_node.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/eci_virtual_node) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_eci_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/eci_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kube_config"></a> [kube\_config](#input\_kube\_config) | n/a | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouecivirtualnode56516"` | no |
<!-- END_TF_DOCS -->    