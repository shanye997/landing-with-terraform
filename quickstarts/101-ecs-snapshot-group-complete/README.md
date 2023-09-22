<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_disk.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/disk) | resource |
| [alicloud_disk_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/disk_attachment) | resource |
| [alicloud_ecs_snapshot_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ecs_snapshot_group) | resource |
| [alicloud_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_instant_access_retention_days_var"></a> [instant\_access\_retention\_days\_var](#input\_instant\_access\_retention\_days\_var) | n/a | `string` | `"1"` | no |
| <a name="input_instant_access_var"></a> [instant\_access\_var](#input\_instant\_access\_var) | n/a | `string` | `"true"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouecssnapshotgroup20354"` | no |
<!-- END_TF_DOCS -->    