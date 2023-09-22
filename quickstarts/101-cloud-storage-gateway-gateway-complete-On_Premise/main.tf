resource "alicloud_cloud_storage_gateway_storage_bundle" "default" {
  storage_bundle_name = var.name
}

resource "alicloud_cloud_storage_gateway_gateway" "default" {
  gateway_name      = var.gateway_name_var
  location          = "On_Premise"
  payment_type      = "PayAsYouGo"
  storage_bundle_id = alicloud_cloud_storage_gateway_storage_bundle.default.id
  type              = "Iscsi"
  description       = var.description_var
}
