<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_slb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/slb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"1"` | no |
| <a name="input_delete_protection_var"></a> [delete\_protection\_var](#input\_delete\_protection\_var) | n/a | `string` | `"off"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"PayByCLCU"` | no |
| <a name="input_internet_charge_type_var"></a> [internet\_charge\_type\_var](#input\_internet\_charge\_type\_var) | n/a | `string` | `"PayByTraffic"` | no |
| <a name="input_load_balancer_spec_var"></a> [load\_balancer\_spec\_var](#input\_load\_balancer\_spec\_var) | n/a | `string` | `"slb.s3.small"` | no |
| <a name="input_modification_protection_reason_var"></a> [modification\_protection\_reason\_var](#input\_modification\_protection\_reason\_var) | n/a | `string` | `"tf-test"` | no |
| <a name="input_modification_protection_status_var"></a> [modification\_protection\_status\_var](#input\_modification\_protection\_status\_var) | n/a | `string` | `"ConsoleProtection"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouslbloadbalancer55988"` | no |
| <a name="input_payment_type_var"></a> [payment\_type\_var](#input\_payment\_type\_var) | n/a | `string` | `"PayAsYouGo"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"active"` | no |
<!-- END_TF_DOCS -->    