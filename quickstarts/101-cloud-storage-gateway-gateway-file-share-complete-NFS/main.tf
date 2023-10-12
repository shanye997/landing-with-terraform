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
  transfer_acceleration   = var.transfer_acceleration_var
  cache_mode              = "Cache"
  remote_sync             = var.remote_sync_var
  bypass_cache_read       = var.bypass_cache_read_var
  fe_limit                = var.fe_limit_var
  oss_endpoint            = alicloud_oss_bucket.default.extranet_endpoint
  squash                  = var.squash_var
  oss_bucket_name         = alicloud_oss_bucket.default.bucket
  rw_client_list          = var.rw_client_list_var
  fast_reclaim            = var.fast_reclaim_var
  lag_period              = var.lag_period_var
  direct_io               = "false"
  ignore_delete           = var.ignore_delete_var
  local_path              = alicloud_cloud_storage_gateway_gateway_cache_disk.default.local_file_path
  nfs_v4_optimization     = var.nfs_v4_optimization_var
  protocol                = "NFS"
  path_prefix             = "/home"
  polling_interval        = var.polling_interval_var
  ro_client_list          = var.ro_client_list_var
  oss_bucket_ssl          = "false"
  backend_limit           = var.backend_limit_var
  in_place                = "false"
  support_archive         = "true"
  gateway_file_share_name = var.name
  gateway_id              = alicloud_cloud_storage_gateway_gateway.default.id
}
