<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_click_house_db_cluster.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/click_house_db_cluster) | resource |
| [alicloud_click_house_regions.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/click_house_regions) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_db_cluster_description_var"></a> [db\_cluster\_description\_var](#input\_db\_cluster\_description\_var) | n/a | `string` | `"tf-examplecn-hangzhouclickhousedbcluster70743_updateAll"` | no |
| <a name="input_maintain_time_var"></a> [maintain\_time\_var](#input\_maintain\_time\_var) | n/a | `string` | `"00:00Z-01:00Z"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
<!-- END_TF_DOCS -->    