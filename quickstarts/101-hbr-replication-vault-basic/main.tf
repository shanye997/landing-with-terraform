provider "alicloud" {
  alias  = "source"
  region = var.region_source
}

resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
  provider   = alicloud.source
}

data "alicloud_hbr_replication_vault_regions" "default" {}

resource "alicloud_hbr_replication_vault" "default" {
  replication_source_region_id = var.region_source
  provider                     = "alicloud.replication"
  vault_name                   = var.vault_name_var
  replication_source_vault_id  = alicloud_hbr_vault.default.id
  depends_on = [
    alicloud_hbr_vault.default
  ]
}
