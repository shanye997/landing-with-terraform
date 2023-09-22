<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_alb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_listener) | resource |
| [alicloud_alb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_load_balancer) | resource |
| [alicloud_alb_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_rule) | resource |
| [alicloud_alb_server_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/alb_server_group) | resource |
| [alicloud_vswitch.vswitch_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vswitch.vswitch_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_alb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/alb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default_1](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_vswitches.default_2](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dry_run_var"></a> [dry\_run\_var](#input\_dry\_run\_var) | n/a | `string` | `"false"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhoualbrule27379"` | no |
| <a name="input_priority_var"></a> [priority\_var](#input\_priority\_var) | n/a | `string` | `"666"` | no |
<!-- END_TF_DOCS -->    