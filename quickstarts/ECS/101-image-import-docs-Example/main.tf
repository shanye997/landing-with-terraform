resource "alicloud_image_import" "this" {
  description  = "test import image"
  architecture = "x86_64"
  image_name   = "test-import-image"
  license_type = "Auto"
  platform     = "Ubuntu"
  os_type      = "linux"
  disk_device_mapping {
    disk_image_size = 5
    oss_bucket      = "testimportimage"
    oss_object      = "root.img"
  }
}