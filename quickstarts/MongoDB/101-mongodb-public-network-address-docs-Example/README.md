## Introduction

This example is used to create a `alicloud_mongodb_public_network_address` resource.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_mongodb_instance.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mongodb_instance) | resource |
| [alicloud_mongodb_public_network_address.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mongodb_public_network_address) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_mongodb_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/mongodb_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example"` | no |
<!-- END_TF_DOCS -->
