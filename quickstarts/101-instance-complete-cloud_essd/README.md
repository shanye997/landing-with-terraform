<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_auto_snapshot_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_auto_snapshot_policy) | resource |
| [alicloud_ecs_auto_snapshot_policy.default1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_auto_snapshot_policy) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_kms_key.key](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_force_delete_var"></a> [force\_delete\_var](#input\_force\_delete\_var) | n/a | `string` | `"true"` | no |
| <a name="input_host_name_var"></a> [host\_name\_var](#input\_host\_name\_var) | n/a | `string` | `"test"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PostPaid"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByTraffic"` | no |
| <a name="input_internet_max_bandwidth_out_var"></a> [internet\_max\_bandwidth\_out\_var](#input\_internet\_max\_bandwidth\_out\_var) | n/a | `string` | `"5"` | no |
| <a name="input_maintenance_action_var"></a> [maintenance\_action\_var](#input\_maintenance\_action\_var) | n/a | `string` | `"AutoRecover"` | no |
| <a name="input_maintenance_notify_var"></a> [maintenance\_notify\_var](#input\_maintenance\_notify\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleEcsInstanceConfigBasic4004"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Tftest123"` | no |
<!-- END_TF_DOCS -->    