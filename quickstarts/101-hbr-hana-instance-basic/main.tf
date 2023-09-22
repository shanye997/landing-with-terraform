resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

resource "alicloud_hbr_hana_instance" "default" {
  vault_id = alicloud_hbr_vault.default.id
}
