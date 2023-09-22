<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cms_hybrid_monitor_fc_task.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_hybrid_monitor_fc_task) | resource |
| [alicloud_cms_namespace.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cms_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecmshybridmonitorfctask17478"` | no |
| <a name="input_yarm_config_var"></a> [yarm\_config\_var](#input\_yarm\_config\_var) | n/a | `string` | `"---\\nproducts:\\n- namespace: \\\"acs_ecs_dashboard1\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"CPUUtilization\\\"\\n    - \\\"DiskReadBPS\\\"\\n    - \\\"InternetOut\\\"\\n    - \\\"IntranetOut\\\"\\n    - \\\"cpu_idle\\\"\\n    - \\\"cpu_system\\\"\\n    - \\\"cpu_total\\\"\\n    - \\\"diskusage_utilization\\\"\\n- namespace: \\\"acs_rds_dashboard\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"MySQL_QPS\\\"\\n    - \\\"MySQL_TPS\\\"\\n- namespace: \\\"acs_ecs_dashboard\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"cpu_total\\\"\\n    - \\\"diskusage_utilization\\\"\\n    - \\\"memory_usedutilization\\\"\\n    - \\\"net_tcpconnection\\\"\\n"` | no |
<!-- END_TF_DOCS -->    