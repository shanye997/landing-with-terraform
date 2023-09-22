<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_slb_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_listener) | resource |
| [alicloud_slb_load_balancer.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/slb_load_balancer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bandwidth_var"></a> [bandwidth\_var](#input\_bandwidth\_var) | n/a | `string` | `"10"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleSlbListenerSamePort8069"` | no |
<!-- END_TF_DOCS -->    