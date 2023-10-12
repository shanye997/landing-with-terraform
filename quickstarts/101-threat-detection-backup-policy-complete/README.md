<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_threat_detection_backup_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/threat_detection_backup_policy) | resource |
| [alicloud_threat_detection_assets.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/threat_detection_assets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_policy_name_var"></a> [backup\_policy\_name\_var](#input\_backup\_policy\_name\_var) | n/a | `string` | `"tf-exampleThreatDetectionBackupPolicy-name56074"` | no |
| <a name="input_policy_var"></a> [policy\_var](#input\_policy\_var) | n/a | `string` | `"{\\\"Exclude\\\":[\\\"/bin/\\\",\\\"/usr/bin/\\\",\\\"/sbin/\\\",\\\"/boot/\\\",\\\"/proc/\\\",\\\"/sys/\\\",\\\"/srv/\\\",\\\"/lib/\\\",\\\"/selinux/\\\",\\\"/usr/sbin/\\\",\\\"/run/\\\",\\\"/lib32/\\\",\\\"/lib64/\\\",\\\"/lost+found/\\\",\\\"/var/lib/kubelet/\\\",\\\"/var/lib/ntp/proc\\\",\\\"/var/lib/container\\\"],\\\"ExcludeSystemPath\\\":true,\\\"Include\\\":[],\\\"IsDefault\\\":1,\\\"Retention\\\":6,\\\"Schedule\\\":\\\"I|1668703620|PT24H\\\",\\\"Source\\\":[],\\\"SpeedLimiter\\\":\\\"\\\",\\\"UseVss\\\":true}"` | no |
<!-- END_TF_DOCS -->    