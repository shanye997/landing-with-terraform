<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_arms_prometheus.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_prometheus) | resource |
| [alicloud_arms_remote_write.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/arms_remote_write) | resource |
| [alicloud_security_group.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/security_group) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.vswitch](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example-ArmsRW32"` | no |
| <a name="input_remote_write_yaml_var"></a> [remote\_write\_yaml\_var](#input\_remote\_write\_yaml\_var) | n/a | `string` | `"remote_write:\\n- name: ArmsRemoteWrite\\n  url: http://47.96.227.137:8080/prometheus/xxx/yyy/cn-hangzhou/api/v3/writen  basic_auth: {username: 888, password: '******'}\\n  write_relabel_configs:\\n  - source_labels: [instance_id]\\n    separator: ;\\n    regex: si-6e2ca86444db4e55a7c1\\n    replacement: $1\\n    action: keep\\n"` | no |
<!-- END_TF_DOCS -->    