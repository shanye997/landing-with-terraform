data "alicloud_ecd_images" "default" {
  image_type            = "SYSTEM"
  os_type               = "Windows"
  desktop_instance_type = "eds.hf.4c8g"
}

data "alicloud_ecd_desktop_types" "default" {
  instance_type_family = "eds.hf"
  cpu_count            = 4
  memory_size          = 8192
}

resource "alicloud_ecd_bundle" "default" {
  root_disk_size_gib = "80"
  desktop_type       = data.alicloud_ecd_desktop_types.default.ids.0
  image_id           = data.alicloud_ecd_images.default.ids.1
  user_disk_size_gib = [
    "70"
  ]
}
