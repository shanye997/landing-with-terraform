<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_dedicated_host.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_dedicated_host) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_instance_types.special](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByTraffic"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"5"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEcsInstanceConfigSpot5337"` | no |
| <a name="input_spot_duration_var"></a> [spot\_duration\_var](#input\_spot\_duration\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    