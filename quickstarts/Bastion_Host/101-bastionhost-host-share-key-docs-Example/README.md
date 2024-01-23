<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_bastionhost_host_share_key` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_bastionhost_host_share_key.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_host_share_key) | resource |
| [alicloud_bastionhost_instance.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/bastionhost_instance) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_example"` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | n/a | `string` | `"LS0tLS1CR*******"` | no |
<!-- END_TF_DOCS -->    