<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_hana_backup_client.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_hana_backup_client) | resource |
| [alicloud_hbr_vaults.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/hbr_vaults) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_info_var"></a> [client\_info\_var](#input\_client\_info\_var) | n/a | `string` | `"[ { \\\"instanceId\\\": \\\"i-bp1dpl8hfbkh5rvvcmsg\\\", \\\"clusterId\\\": \\\"cl-000cnu7ti2rmj23dhp77\\\", \\\"sourceTypes\\\": [ \\\"HANA\\\" ]  }]"` | no |
<!-- END_TF_DOCS -->    