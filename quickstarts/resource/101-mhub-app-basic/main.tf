resource "alicloud_mhub_product" "default" {
  product_name = var.name
}

resource "alicloud_mhub_app" "default" {
  app_name   = var.app_name_var
  product_id = alicloud_mhub_product.default.id
  type       = var.type_var
}
