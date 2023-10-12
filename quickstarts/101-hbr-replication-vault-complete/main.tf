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
  provider                     = "alicloud.replication"
  replication_source_region_id = var.region_source
  replication_source_vault_id  = alicloud_hbr_vault.default.id
  vault_name                   = var.vault_name_var
  vault_storage_class          = "STANDARD"
  depends_on = [
    alicloud_hbr_vault.default
  ]
  description = var.description_var
}
