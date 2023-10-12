<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_simple_application_server_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/simple_application_server_instance) | resource |
| [alicloud_simple_application_server_images.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/simple_application_server_images) | data source |
| [alicloud_simple_application_server_plans.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/simple_application_server_plans) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_disk_size_var"></a> [data\_disk\_size\_var](#input\_data\_disk\_size\_var) | n/a | `string` | `"100"` | no |
| <a name="input_instance_name_var"></a> [instance\_name\_var](#input\_instance\_name\_var) | n/a | `string` | `"tf-exampleswasinstance29040"` | no |
| <a name="input_password_var"></a> [password\_var](#input\_password\_var) | n/a | `string` | `"Test123!"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_status_var"></a> [status\_var](#input\_status\_var) | n/a | `string` | `"Running"` | no |
<!-- END_TF_DOCS -->    