<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_db_instance.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/db_instance) | resource |
| [alicloud_kms_key.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/kms_key) | resource |
| [alicloud_ram_policy.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_policy) | resource |
| [alicloud_ram_role.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role) | resource |
| [alicloud_ram_role_policy_attachment.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/ram_role_policy_attachment) | resource |
| [alicloud_vswitch.this](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_db_instance_classes.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_instance_classes) | data source |
| [alicloud_db_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/db_zones) | data source |
| [alicloud_ram_roles.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/ram_roles) | data source |
| [alicloud_resource_manager_resource_groups.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/resource_manager_resource_groups) | data source |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acl_var"></a> [acl\_var](#input\_acl\_var) | n/a | `string` | `"cert"` | no |
| <a name="input_auto_upgrade_minor_version_var"></a> [auto\_upgrade\_minor\_version\_var](#input\_auto\_upgrade\_minor\_version\_var) | n/a | `string` | `"Auto"` | no |
| <a name="input_ca_type_var"></a> [ca\_type\_var](#input\_ca\_type\_var) | n/a | `string` | `"aliyun"` | no |
| <a name="input_category_var"></a> [category\_var](#input\_category\_var) | n/a | `string` | `"HighAvailability"` | no |
| <a name="input_client_ca_cert_var"></a> [client\_ca\_cert\_var](#input\_client\_ca\_cert\_var) | n/a | `string` | `"-----BEGIN CERTIFICATE-----\\nMIIC+TCCAeGgAwIBAgIJAKfv52qIKAi7MA0GCSqGSIb3DQEBCwUAMBMxETAPBgNV\\nBAMMCHJvb3QtY2ExMB4XDTIxMDQyMzA3Mjk1M1oXDTMxMDQyMTA3Mjk1M1owEzER\\nMA8GA1UEAwwIcm9vdC1jYTEwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB\\nAQCyCXrZgqdge6oSji+URDXN0pMWnq4D8doP8quz09shN9TU4iqtyX+Bw+uYOoNF\\ndNL4W09p8ykca3RzZghXdbHvtSZy5oCe1rup0xaATAgejDZKBi32ogLXdlA5UMyi\\nc0OqIQpOZ+OmeMEVEZP7wsbDy7jS2v59d5OI4tnH2V2SDoWlI/7F9QOq36ER0UqY\\nnnjJGnOsTDVeSy4ZXHMT0pXvSSLHsMMhzSJa6t3CiOuAeAW43zIS9tag0yvJI1v7\\nxKSJTLs9O5V/h+oD9xofQ4kb4kOdStB2KpDteNfJWJoJYdvRMO+g1u6c2ovlc7KR\\nrJPX2ZMJh14q99gPt6Dd+beVAgMBAAGjUDBOMB0GA1UdDgQWBBTDGEb5Aj6SI7hM\\nC+AJa3YTNLdDrTAfBgNVHSMEGDAWgBTDGEb5Aj6SI7hMC+AJa3YTNLdDrTAMBgNV\\nHRMEBTADAQH/MA0GCSqGSIb3DQEBCwUAA4IBAQAXWXp6H4bAMZZN6b/rmuxvn4XP\\n8p/7NN7BgPQSvQ24U5n8Lo2X8yXYZ4Si/NfWBitAqHceTk6rYTFhODG8CykiduHh\\nowfhSjlMj9MGVw3j6I7crBuQ8clUGpy0mUNWJ9ObIdEMaVT+S1Jwk88Byf5FEBxO\\nZLg+hg4NQh9qspFAtnhprU9LbcpVtQFY6uyCPs6OEOpPWF1Vtcu+ibQdIQV/e1SQ\\n3NJ54R3MCfgEb9errFPv/rXscgahSMxW0sDvObAYdeIeiVeBp3wYKKFHeRNFPGT1\\njzei5hlUJzGHf9DlgAH/KODvWUY5cvpuMtJY2yLyJv9xHjjyMnZZAOtHZxfR\\n-----END CERTIFICATE-----"` | no |
| <a name="input_client_ca_enabled_var"></a> [client\_ca\_enabled\_var](#input\_client\_ca\_enabled\_var) | n/a | `string` | `"1"` | no |
| <a name="input_client_cert_revocation_list_var"></a> [client\_cert\_revocation\_list\_var](#input\_client\_cert\_revocation\_list\_var) | n/a | `string` | `"-----BEGIN X509 CRL-----\\nMIIBpzCBkAIBATANBgkqhkiG9w0BAQsFADATMREwDwYDVQQDDAhyb290LWNhMRcN\\nMjEwNDI5MDYwODMyWhcNMjEwNTI5MDYwODMyWjA4MBoCCQCG3wQwiFfYbRcNMjEw\\nNDIzMTE0MTI4WjAaAgkAht8EMIhX2G8XDTIxMDQyOTA2MDc1N1qgDzANMAsGA1Ud\\nFAQEAgIQATANBgkqhkiG9w0BAQsFAAOCAQEAq/M+t0zWLZzqw0T23rZsOhjd2/7+\\nu1aHAW5jtjWU+lY4UxGqRsjUTJZnOiSq1w7CWhGxanyjtY/hmSeO6hGMuCmini8f\\nNEq/jRvfeS7yJieFucnW4JFmz1HbqSr2S1uXRuHB1ziTRtGm3Epe0qynKm6O4L4q\\nCIIqba1gye6H4BmEHaQIi4fplN7buWoeC5Ae9EdxRr3+59P4qJhHD4JGller8/QS\\n3m1g75AHJO1dxvAEWy8DrrbP5SrqrsP8mmoNVIHXzCQPGEMnA1sG84365krwR+GC\\noi1eBKozVqfnyLRA1C/ZY+dtt3I6zocA2Lt2+JX47VsbXApGgAPVIpKN6A==\\n-----END X509 CRL-----"` | no |
| <a name="input_client_crl_enabled_var"></a> [client\_crl\_enabled\_var](#input\_client\_crl\_enabled\_var) | n/a | `string` | `"1"` | no |
| <a name="input_connection_string_prefix_var"></a> [connection\_string\_prefix\_var](#input\_connection\_string\_prefix\_var) | n/a | `string` | `"nkwmxym6rm"` | no |
| <a name="input_db_instance_ip_array_attribute_var"></a> [db\_instance\_ip\_array\_attribute\_var](#input\_db\_instance\_ip\_array\_attribute\_var) | n/a | `string` | `""` | no |
| <a name="input_db_instance_ip_array_name_var"></a> [db\_instance\_ip\_array\_name\_var](#input\_db\_instance\_ip\_array\_name\_var) | n/a | `string` | `"default"` | no |
| <a name="input_db_instance_storage_type_var"></a> [db\_instance\_storage\_type\_var](#input\_db\_instance\_storage\_type\_var) | n/a | `string` | `"cloud_essd2"` | no |
| <a name="input_db_is_ignore_case_var"></a> [db\_is\_ignore\_case\_var](#input\_db\_is\_ignore\_case\_var) | n/a | `string` | `"false"` | no |
| <a name="input_db_time_zone_var"></a> [db\_time\_zone\_var](#input\_db\_time\_zone\_var) | n/a | `string` | `"America/New_York"` | no |
| <a name="input_deletion_protection_var"></a> [deletion\_protection\_var](#input\_deletion\_protection\_var) | n/a | `string` | `"true"` | no |
| <a name="input_direction_var"></a> [direction\_var](#input\_direction\_var) | n/a | `string` | `"Down"` | no |
| <a name="input_effective_time_var"></a> [effective\_time\_var](#input\_effective\_time\_var) | n/a | `string` | `"Immediate"` | no |
| <a name="input_engine_version_var"></a> [engine\_version\_var](#input\_engine\_version\_var) | n/a | `string` | `"12.0"` | no |
| <a name="input_ha_config_var"></a> [ha\_config\_var](#input\_ha\_config\_var) | n/a | `string` | `"Manual"` | no |
| <a name="input_instance_charge_type_var"></a> [instance\_charge\_type\_var](#input\_instance\_charge\_type\_var) | n/a | `string` | `"Postpaid"` | no |
| <a name="input_instance_storage_var"></a> [instance\_storage\_var](#input\_instance\_storage\_var) | n/a | `string` | `"500"` | no |
| <a name="input_maintain_time_var"></a> [maintain\_time\_var](#input\_maintain\_time\_var) | n/a | `string` | `"22:00Z-02:00Z"` | no |
| <a name="input_manual_ha_time_var"></a> [manual\_ha\_time\_var](#input\_manual\_ha\_time\_var) | n/a | `string` | `"2023-09-22T15:34:21Z"` | no |
| <a name="input_monitoring_period_var"></a> [monitoring\_period\_var](#input\_monitoring\_period\_var) | n/a | `string` | `"60"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-exampleDBInstanceConfig572"` | no |
| <a name="input_period_var"></a> [period\_var](#input\_period\_var) | n/a | `string` | `"1"` | no |
| <a name="input_port_var"></a> [port\_var](#input\_port\_var) | n/a | `string` | `"5999"` | no |
| <a name="input_replication_acl_var"></a> [replication\_acl\_var](#input\_replication\_acl\_var) | n/a | `string` | `"cert"` | no |
| <a name="input_security_ip_mode_var"></a> [security\_ip\_mode\_var](#input\_security\_ip\_mode\_var) | n/a | `string` | `"safety"` | no |
| <a name="input_security_ip_type_var"></a> [security\_ip\_type\_var](#input\_security\_ip\_type\_var) | n/a | `string` | `"IPv4"` | no |
| <a name="input_ssl_action_var"></a> [ssl\_action\_var](#input\_ssl\_action\_var) | n/a | `string` | `"Open"` | no |
| <a name="input_storage_auto_scale_var"></a> [storage\_auto\_scale\_var](#input\_storage\_auto\_scale\_var) | n/a | `string` | `"Enable"` | no |
| <a name="input_storage_threshold_var"></a> [storage\_threshold\_var](#input\_storage\_threshold\_var) | n/a | `string` | `"40"` | no |
| <a name="input_storage_upper_bound_var"></a> [storage\_upper\_bound\_var](#input\_storage\_upper\_bound\_var) | n/a | `string` | `"1000"` | no |
| <a name="input_target_minor_version_var"></a> [target\_minor\_version\_var](#input\_target\_minor\_version\_var) | n/a | `string` | `"rds_postgres_1200_20230630"` | no |
| <a name="input_tcp_connection_type_var"></a> [tcp\_connection\_type\_var](#input\_tcp\_connection\_type\_var) | n/a | `string` | `"SHORT"` | no |
| <a name="input_tde_status_var"></a> [tde\_status\_var](#input\_tde\_status\_var) | n/a | `string` | `"Enabled"` | no |
| <a name="input_upgrade_time_var"></a> [upgrade\_time\_var](#input\_upgrade\_time\_var) | n/a | `string` | `"Immediate"` | no |
| <a name="input_whitelist_network_type_var"></a> [whitelist\_network\_type\_var](#input\_whitelist\_network\_type\_var) | n/a | `string` | `"MIX"` | no |
<!-- END_TF_DOCS -->    