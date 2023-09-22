resource "alicloud_hbr_vault" "default" {
  vault_type          = "STANDARD"
  description         = var.description_var
  encrypt_type        = "HBR_PRIVATE"
  vault_name          = var.vault_name_var
  vault_storage_class = "STANDARD"
}
