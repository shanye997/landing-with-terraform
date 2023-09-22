<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cen_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_instance) | resource |
| [alicloud_cen_transit_router.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router) | resource |
| [alicloud_cen_transit_router_cidr.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cen_transit_router_cidr) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_var"></a> [cidr\_var](#input\_cidr\_var) | n/a | `string` | `"192.168.0.0/18"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhou-name30989"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhou-name30989"` | no |
| <a name="input_publish_cidr_route_var"></a> [publish\_cidr\_route\_var](#input\_publish\_cidr\_route\_var) | n/a | `string` | `"true"` | no |
| <a name="input_transit_router_cidr_name_var"></a> [transit\_router\_cidr\_name\_var](#input\_transit\_router\_cidr\_name\_var) | n/a | `string` | `"tf-examplecn-hangzhou-name30989"` | no |
<!-- END_TF_DOCS -->    