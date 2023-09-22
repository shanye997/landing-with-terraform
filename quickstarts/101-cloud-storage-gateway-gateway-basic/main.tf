resource "alicloud_cloud_storage_gateway_storage_bundle" "default" {
  storage_bundle_name = var.name
}

resource "alicloud_cloud_storage_gateway_gateway" "default" {
  storage_bundle_id = alicloud_cloud_storage_gateway_storage_bundle.default.id
  location          = "On_Premise"
  gateway_name      = var.gateway_name_var
  type              = "Iscsi"
}
