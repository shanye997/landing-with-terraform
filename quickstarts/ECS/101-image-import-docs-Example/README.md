## Introduction

This example is used to create a `alicloud_image_import` resource.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_image_import.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/image_import) | resource |
| [alicloud_oss_bucket.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oss_bucket) | resource |
| [alicloud_oss_bucket_object.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/oss_bucket_object) | resource |
| [random_integer.default](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"terraform-image-import-example"` | no |
<!-- END_TF_DOCS -->
