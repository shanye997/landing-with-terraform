<!-- BEGIN_TF_DOCS -->
## Introduction

This example is used to create a `alicloud_cs_kubernetes_node_pool` resource.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | n/a |

## Resources

| Name | Type |
|------|------|
| [alicloud_cs_kubernetes_node_pool.auto_scaling](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.customized_kubelet](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.desired_size](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.exist_node](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.maintenance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.prepaid_node](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.scaling_config](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.spot_auto_scaling](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.spot_instance](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_kubernetes_node_pool.window](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_kubernetes_node_pool) | resource |
| [alicloud_cs_managed_kubernetes.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/cs_managed_kubernetes) | resource |
| [alicloud_key_pair.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/key_pair) | resource |
| [alicloud_vpc.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vpc) | resource |
| [alicloud_vswitch.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/vswitch) | resource |
| [alicloud_images.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/images) | data source |
| [alicloud_instance_types.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/instance_types) | data source |
| [alicloud_zones.default](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/data-sources/zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | `"tf-example"` | no |
<!-- END_TF_DOCS -->    