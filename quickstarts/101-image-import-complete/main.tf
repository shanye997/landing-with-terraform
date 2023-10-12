resource "alicloud_image_import" "default" {
  description = var.description_var
  disk_device_mapping {
    oss_bucket = ""
    oss_object = ""
  }

  image_name   = var.image_name_var
  license_type = "Auto"
  os_type      = "linux"
  platform     = "Ubuntu"
  architecture = "x86_64"
}
