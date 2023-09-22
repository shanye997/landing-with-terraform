data "alicloud_service_catalog_product_as_end_users" "default" {
  name_regex = "ram模板创建"
}

data "alicloud_service_catalog_product_versions" "default" {
  name_regex = "1.0.0"
  product_id = data.alicloud_service_catalog_product_as_end_users.default.users.0.id
}

data "alicloud_service_catalog_launch_options" "default" {
  product_id = data.alicloud_service_catalog_product_as_end_users.default.users.0.id
}

data "alicloud_ros_regions" "all" {}

resource "alicloud_service_catalog_provisioned_product" "default" {
  tags = {
    k4 = "v4"
  }
  parameters {
    parameter_value = "${var.name}"
    parameter_key   = "role_name"
  }

  portfolio_id             = data.alicloud_service_catalog_launch_options.default.options.0.portfolio_id
  product_id               = data.alicloud_service_catalog_product_as_end_users.default.users.0.id
  product_version_id       = data.alicloud_service_catalog_product_versions.default.versions.0.id
  provisioned_product_name = var.name
  stack_region_id          = data.alicloud_ros_regions.all.regions.5.region_id
}
