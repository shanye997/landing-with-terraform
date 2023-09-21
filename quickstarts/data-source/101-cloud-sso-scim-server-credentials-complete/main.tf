data "alicloud_cloud_sso_directories" "default" {}

resource "alicloud_cloud_sso_directory" "default" {
  count          = length(data.alicloud_cloud_sso_directories.default.ids) > 0 ? 0 : 1
  directory_name = var.name
}

locals {
  directory_id = length(data.alicloud_cloud_sso_directories.default.ids) > 0 ? data.alicloud_cloud_sso_directories.default.ids[0] : concat(alicloud_cloud_sso_directory.default.*.id, [""])[0]
}

resource "alicloud_cloud_sso_scim_server_credential" "default" {
  directory_id = local.directory_id
}

data "alicloud_cloud_sso_scim_server_credentials" "default" {
  directory_id = local.directory_id
  ids = [
    "${alicloud_cloud_sso_scim_server_credential.default.id}_fake"
  ]
  status = "Disabled"
}
