resource "alicloud_mhub_product" "default" {
  product_name = var.name
}

resource "alicloud_mhub_app" "default" {
  package_name = var.package_name_var
  product_id   = alicloud_mhub_product.default.id
  type         = var.type_var
  app_name     = var.app_name_var
  encoded_icon = var.encoded_icon_var
  industry_id  = var.industry_id_var
}
