## Introduction

This example is used to create a `alicloud_express_connect_traffic_qos_rule` resource.

<!-- BEGIN_TF_DOCS -->
## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [alicloud_express_connect_traffic_qos.createQos](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/express_connect_traffic_qos) | resource |
| [alicloud_express_connect_traffic_qos_association.associateQos](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/express_connect_traffic_qos_association) | resource |
| [alicloud_express_connect_traffic_qos_queue.createQosQueue](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/express_connect_traffic_qos_queue) | resource |
| [alicloud_express_connect_traffic_qos_rule.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/express_connect_traffic_qos_rule) | resource |
| [alicloud_express_connect_physical_connections.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/express_connect_physical_connections) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"terraform-example"` | no |
<!-- END_TF_DOCS -->
