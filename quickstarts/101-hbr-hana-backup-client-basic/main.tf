data "alicloud_hbr_vaults" "default" {
  name_regex = "tf-test-hbr-hana-client"
}

resource "alicloud_hbr_hana_backup_client" "default" {
  vault_id = data.alicloud_hbr_vaults.default.vaults.0.id
}
