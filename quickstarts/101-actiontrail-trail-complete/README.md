<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_actiontrail_trail.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/actiontrail_trail) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_ram_roles.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ram_roles) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_event_rw_var"></a> [event\_rw\_var](#input\_event\_rw\_var) | n/a | `string` | `"Write"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleactiontrail8453216"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Disable"` | no |
| <a name="input_trail_region_var"></a> [trail\_region\_var](#input\_trail\_region\_var) | n/a | `string` | `"All"` | no |
<!-- END_TF_DOCS -->    