<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_mongodb_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mongodb_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_mongodb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/mongodb_zones) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_password_var"></a> [account\_password\_var](#input\_account\_password\_var) | n/a | `string` | `"YourPassword_123"` | no |
| <a name="input_backup_time_var"></a> [backup\_time\_var](#input\_backup\_time\_var) | n/a | `string` | `"11:00Z-12:00Z"` | no |
| <a name="input_db_instance_class_var"></a> [db\_instance\_class\_var](#input\_db\_instance\_class\_var) | n/a | `string` | `"dds.mongo.2xlarge"` | no |
| <a name="input_db_instance_storage_var"></a> [db\_instance\_storage\_var](#input\_db\_instance\_storage\_var) | n/a | `string` | `"2000"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PrePaid"` | no |
| <a name="input_maintain_end_time_var"></a> [maintain\_end\_time\_var](#input\_maintain\_end\_time\_var) | n/a | `string` | `"03:00Z"` | no |
| <a name="input_maintain_start_time_var"></a> [maintain\_start\_time\_var](#input\_maintain\_start\_time\_var) | n/a | `string` | `"02:00Z"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleMongoDBInstanceClassicConfig4813"` | no |
| <a name="input_name_var"></a> [name\_var](#input\_name\_var) | n/a | `string` | `"tf-exampleMongoDBInstanceClassicConfig4813"` | no |
| <a name="input_readonly_replicas_var"></a> [readonly\_replicas\_var](#input\_readonly\_replicas\_var) | n/a | `string` | `"2"` | no |
| <a name="input_ssl_action_var"></a> [ssl\_action\_var](#input\_ssl\_action\_var) | n/a | `string` | `"Close"` | no |
<!-- END_TF_DOCS -->    