<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_service_mesh_extension_provider.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/service_mesh_extension_provider) | resource |
| [alicloud_service_mesh_service_mesh.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/service_mesh_service_mesh) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_vpcs.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vpcs) | data source |
| [alicloud_vswitches.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/vswitches) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_config_var"></a> [config\_var](#input\_config\_var) | n/a | `string` | `"{\\\"headersToDownstreamOnDeny\\\":[\\\"content-type\\\",\\\"set-cookie\\\"],\\\"headersToUpstreamOnAllow\\\":[\\\"authorization\\\",\\\"cookie\\\",\\\"path\\\",\\\"x-auth-request-access-token\\\",\\\"x-forwarded-access-token\\\"],\\\"includeRequestHeadersInCheck\\\":[\\\"cookie\\\",\\\"x-forward-access-token\\\"],\\\"oidc\\\":{\\\"clientID\\\":\\\"qweqweqwewqeqwe\\\",\\\"clientSecret\\\":\\\"asdasdasdasdsadas\\\",\\\"cookieExpire\\\":\\\"1000\\\",\\\"cookieRefresh\\\":\\\"500\\\",\\\"cookieSecret\\\":\\\"scxzcxzcxzcxzcxz\\\",\\\"issuerURI\\\":\\\"qweqwewqeqweqweqwe\\\",\\\"redirectDomain\\\":\\\"www.alicloud-provider.cn\\\",\\\"redirectProtocol\\\":\\\"http\\\",\\\"scopes\\\":[\\\"profile\\\"]},\\\"port\\\":4180,\\\"service\\\":\\\"asm-oauth2proxy-httpextauth-tf-example-name77777.istio-system.svc.cluster.local\\\",\\\"timeout\\\":\\\"20s\\\"}"` | no |
<!-- END_TF_DOCS -->    