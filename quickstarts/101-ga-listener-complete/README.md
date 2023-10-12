<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_ga_bandwidth_package.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_bandwidth_package) | resource |
| [alicloud_ga_bandwidth_package_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_bandwidth_package_attachment) | resource |
| [alicloud_ga_listener.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ga_listener) | resource |
| [alicloud_cas_certificates.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/cas_certificates) | data source |
| [alicloud_ga_accelerators.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ga_accelerators) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_affinity_var"></a> [client\_affinity\_var](#input\_client\_affinity\_var) | n/a | `string` | `"SOURCE_IP"` | no |
| <a name="input_description_var"></a> [description\_var](#input\_description\_var) | n/a | `string` | `"create_description"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-examplecn-hangzhouAliCloudGaListener12384"` | no |
| <a name="input_protocol_var"></a> [protocol\_var](#input\_protocol\_var) | n/a | `string` | `"HTTPS"` | no |
| <a name="input_proxy_protocol_var"></a> [proxy\_protocol\_var](#input\_proxy\_protocol\_var) | n/a | `string` | `"true"` | no |
| <a name="input_security_policy_id_var"></a> [security\_policy\_id\_var](#input\_security\_policy\_id\_var) | n/a | `string` | `"tls_cipher_policy_1_1"` | no |
<!-- END_TF_DOCS -->    