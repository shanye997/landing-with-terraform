variable "name" {
  default = "tf-testAccServiceCatalogProvisionedProduct"
}

resource "alicloud_service_catalog_provisioned_product" "default" {
  provisioned_product_name = var.name
  stack_region_id          = "cn-hangzhou"
  product_version_id       = "pv-bp1d7dxy2pcc1g"
  product_id               = "prod-bp1u3dkc282cwd"
  portfolio_id             = "port-bp119dvn27jccw"
  tags = {
    "v1" = "tf-test"
  }
  parameters {
    parameter_key   = "role_name"
    parameter_value = var.name
  }
}