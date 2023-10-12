<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_threat_detection_anti_brute_force_rule.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/threat_detection_anti_brute_force_rule) | resource |
| [alicloud_threat_detection_assets.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/threat_detection_assets) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fail_count_var"></a> [fail\_count\_var](#input\_fail\_count\_var) | n/a | `string` | `"70"` | no |
| <a name="input_forbidden_time_var"></a> [forbidden\_time\_var](#input\_forbidden\_time\_var) | n/a | `string` | `"300"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouThreatDetectionAntiBruteForceRule36582"` | no |
| <a name="input_span_var"></a> [span\_var](#input\_span\_var) | n/a | `string` | `"9"` | no |
<!-- END_TF_DOCS -->    