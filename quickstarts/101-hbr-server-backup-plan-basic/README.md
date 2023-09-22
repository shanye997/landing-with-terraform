<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_hbr_server_backup_plan.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/hbr_server_backup_plan) | resource |
| [alicloud_instances.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_server_backup_plan_name_var"></a> [ecs\_server\_backup\_plan\_name\_var](#input\_ecs\_server\_backup\_plan\_name\_var) | n/a | `string` | `"tf-example-hbr-backup-plan3"` | no |
| <a name="input_retention_var"></a> [retention\_var](#input\_retention\_var) | n/a | `string` | `"4"` | no |
| <a name="input_schedule_var"></a> [schedule\_var](#input\_schedule\_var) | n/a | `string` | `"I|1602673264|PT2H"` | no |
<!-- END_TF_DOCS -->    