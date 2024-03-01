<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_gpdb_account` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_gpdb_account.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/gpdb_account) | resource |
| [alicloud_gpdb_instance.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/gpdb_instance) | resource |
| [alicloud_gpdb_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/gpdb_zones) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"terraform-example"` | no |
<!-- END_TF_DOCS -->    