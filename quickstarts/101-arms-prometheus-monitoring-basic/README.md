<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_arms_prometheus.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_prometheus) | resource |
| [alicloud_arms_prometheus_monitoring.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_prometheus_monitoring) | resource |
| [alicloud_cs_kubernetes_node_pool.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_managed_kubernetes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_yaml_var"></a> [config\_yaml\_var](#input\_config\_yaml\_var) | n/a | `string` | `"apiVersion: monitoring.coreos.com/v1\\nkind: ServiceMonitor\\nmetadata:\\n  name: tomcat-demo\\n  namespace: default\\nspec:\\n  endpoints:\\n  - bearerTokenSecret:\\n      key: ''\\n    interval: 30s\\n    path: /metrics\\n    port: tomcat-monitor\\n  namespaceSelector:\\n    any: true\\n  selector:\\n    matchLabels:\\n      app: tomcat"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouarmsprometheusmonitoring25731"` | no |
<!-- END_TF_DOCS -->    