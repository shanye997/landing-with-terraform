<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_mse_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/mse_cluster) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_alias_name_var"></a> [cluster\_alias\_name\_var](#input\_cluster\_alias\_name\_var) | n/a | `string` | `"tf-exampleMseCluster38888"` | no |
| <a name="input_cluster_specification_var"></a> [cluster\_specification\_var](#input\_cluster\_specification\_var) | n/a | `string` | `"MSE_SC_2_4_60_c"` | no |
| <a name="input_instance_count_var"></a> [instance\_count\_var](#input\_instance\_count\_var) | n/a | `string` | `"1"` | no |
<!-- END_TF_DOCS -->    