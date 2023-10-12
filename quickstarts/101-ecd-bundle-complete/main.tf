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
  desktop_type                = data.alicloud_ecd_desktop_types.default.ids.0
  root_disk_performance_level = "PL1"
  user_disk_size_gib = [
    "70"
  ]
  bundle_name                 = "${var.name}"
  description                 = "${var.name}"
  user_disk_performance_level = "PL1"
  image_id                    = data.alicloud_ecd_images.default.ids.1
  language                    = var.language_var
  root_disk_size_gib          = "80"
}
