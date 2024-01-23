<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_cr_ee_sync_rule` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cr_ee_instance.source](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_instance) | resource |
| [alicloud_cr_ee_instance.target](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_instance) | resource |
| [alicloud_cr_ee_namespace.source](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_namespace) | resource |
| [alicloud_cr_ee_namespace.target](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_namespace) | resource |
| [alicloud_cr_ee_repo.source](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_repo) | resource |
| [alicloud_cr_ee_repo.target](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_repo) | resource |
| [alicloud_cr_ee_sync_rule.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cr_ee_sync_rule) | resource |
| [alicloud_regions.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/regions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example"` | no |
<!-- END_TF_DOCS -->    