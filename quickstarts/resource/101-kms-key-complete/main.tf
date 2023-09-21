resource "alicloud_kms_key" "default" {
  rotation_interval = var.rotation_interval_var
  status            = var.status_var
  tags = {
    Created = "TF_Update"
    For     = "Key_Update"
  }
  automatic_rotation     = var.automatic_rotation_var
  description            = var.description_var
  key_spec               = "Aliyun_AES_256"
  pending_window_in_days = var.pending_window_in_days_var
  protection_level       = "HSM"
}
