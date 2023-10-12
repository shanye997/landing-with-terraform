<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ecs_network_interface.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_network_interface) | resource |
| [alicloud_security_group.group](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_slb_backend_server.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_backend_server) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |
| [alicloud_slb_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/slb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbBackendServersVpc"` | no |
<!-- END_TF_DOCS -->    