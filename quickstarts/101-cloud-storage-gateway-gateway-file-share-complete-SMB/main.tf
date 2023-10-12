data "alicloud_cloud_storage_gateway_stocks" "default" {
  gateway_class = "Standard"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_cloud_storage_gateway_stocks.default.stocks.0.zone_id
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_cloud_storage_gateway_stocks.default.stocks.0.zone_id
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_cloud_storage_gateway_storage_bundle" "default" {
  storage_bundle_name = var.name
}

resource "alicloud_cloud_storage_gateway_gateway" "default" {
  description              = "tf-acctestDesalone"
  gateway_class            = "Standard"
  type                     = "File"
  payment_type             = "PayAsYouGo"
  vswitch_id               = local.vswitch_id
  release_after_expiration = true
  public_network_bandwidth = 10
  storage_bundle_id        = alicloud_cloud_storage_gateway_storage_bundle.default.id
  location                 = "Cloud"
  gateway_name             = var.name
}

resource "alicloud_cloud_storage_gateway_gateway_cache_disk" "default" {
  cache_disk_category   = "cloud_efficiency"
  gateway_id            = alicloud_cloud_storage_gateway_gateway.default.id
  cache_disk_size_in_gb = 50
}

resource "alicloud_oss_bucket" "default" {
  bucket = var.name
}

resource "alicloud_cloud_storage_gateway_gateway_file_share" "default" {
  ro_user_list             = var.ro_user_list_var
  gateway_file_share_name  = var.name
  fast_reclaim             = var.fast_reclaim_var
  remote_sync_download     = var.remote_sync_download_var
  windows_acl              = var.windows_acl_var
  browsable                = var.browsable_var
  gateway_id               = alicloud_cloud_storage_gateway_gateway.default.id
  cache_mode               = "Sync"
  direct_io                = "true"
  support_archive          = "false"
  transfer_acceleration    = var.transfer_acceleration_var
  rw_user_list             = var.rw_user_list_var
  remote_sync              = var.remote_sync_var
  in_place                 = "true"
  protocol                 = "SMB"
  access_based_enumeration = var.access_based_enumeration_var
  ignore_delete            = var.ignore_delete_var
  oss_endpoint             = alicloud_oss_bucket.default.intranet_endpoint
  backend_limit            = var.backend_limit_var
  lag_period               = var.lag_period_var
  local_path               = alicloud_cloud_storage_gateway_gateway_cache_disk.default.local_file_path
  fe_limit                 = var.fe_limit_var
  partial_sync_paths       = "/root/"
  download_limit           = var.download_limit_var
  polling_interval         = var.polling_interval_var
  oss_bucket_name          = alicloud_oss_bucket.default.bucket
  oss_bucket_ssl           = "true"
  path_prefix              = ""
}
