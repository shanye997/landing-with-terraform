<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_api_gateway_plugin.default](https://registry.terraform.io/providers/hashicorp/alicloud/latest/docs/resources/api_gateway_plugin) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf_exampleapigatewayplugin2888"` | no |
| <a name="input_plugin_data_var"></a> [plugin\_data\_var](#input\_plugin\_data\_var) | n/a | `string` | `"{\\\"allowOrigins\\\": \\\"api.foo.com\\\",\\\"allowMethods\\\": \\\"GET,POST,PUT,DELETE,HEAD,OPTIONS,PATCH\\\",\\\"allowHeaders\\\": \\\"Authorization,Accept,Accept-Ranges,Cache-Control,Range,Date,Content-Type,Content-Length,Content-MD5,User-Agent,X-Ca-Signature,X-Ca-Signature-Headers,X-Ca-Signature-Method,X-Ca-Key,X-Ca-Timestamp,X-Ca-Nonce,X-Ca-Stage,X-Ca-Request-Mode,x-ca-deviceid\\\",\\\"exposeHeaders\\\": \\\"Content-MD5,Server,Date,Latency,X-Ca-Request-Id,X-Ca-Error-Code,X-Ca-Error-Message\\\",\\\"maxAge\\\": 172800,\\\"allowCredentials\\\": true}"` | no |
<!-- END_TF_DOCS -->    