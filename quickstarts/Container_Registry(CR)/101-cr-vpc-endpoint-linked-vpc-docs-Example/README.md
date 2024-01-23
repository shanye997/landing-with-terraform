<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_cr_vpc_endpoint_linked_vpc` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cr_ee_instance.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_instance) | resource |
| [alicloud_cr_vpc_endpoint_linked_vpc.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_vpc_endpoint_linked_vpc) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example"` | no |
<!-- END_TF_DOCS -->    