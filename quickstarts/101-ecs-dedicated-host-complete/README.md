<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_dedicated_host.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_dedicated_host) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_on_maintenance_var"></a> [action\_on\_maintenance\_var](#input\_action\_on\_maintenance\_var) | n/a | `string` | `"Migrate"` | no |
| <a name="input_auto_placement_var"></a> [auto\_placement\_var](#input\_auto\_placement\_var) | n/a | `string` | `"on"` | no |
| <a name="input_auto_renew_period_var"></a> [auto\_renew\_period\_var](#input\_auto\_renew\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_auto_renew_var"></a> [auto\_renew\_var](#input\_auto\_renew\_var) | n/a | `string` | `"true"` | no |
| <a name="input_dedicated_host_name_var"></a> [dedicated\_host\_name\_var](#input\_dedicated\_host\_name\_var) | n/a | `string` | `"tf-exampleEcsDedicatedHost250135"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"From_Terraform"` | no |
| <a name="input_expired_time_var"></a> [expired\_time\_var](#input\_expired\_time\_var) | n/a | `string` | `"1"` | no |
| <a name="input_min_quantity_var"></a> [min\_quantity\_var](#input\_min\_quantity\_var) | n/a | `string` | `"1"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_sale_cycle_var"></a> [sale\_cycle\_var](#input\_sale\_cycle\_var) | n/a | `string` | `"Week"` | no |
<!-- END_TF_DOCS -->    