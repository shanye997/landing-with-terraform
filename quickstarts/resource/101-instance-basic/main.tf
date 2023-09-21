data "alicloud_instance_types" "default" {
  cpu_core_count = 1
  memory_size    = 2
}

data "alicloud_images" "default" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}

resource "alicloud_security_group" "default" {
  count = "2"
  name  = "${var.name}"
}

resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

resource "alicloud_instance" "default" {
  instance_type = data.alicloud_instance_types.default.instance_types.0.id
  image_id      = data.alicloud_images.default.images.1.id
  data_disks {
    device = "/dev/xvdb"
    name   = "${var.name}-1"
    size   = "20"
  }
  data_disks {
    category = "cloud_ssd"
    name     = "${var.name}-2"
    size     = "20"
  }
  data_disks {
    encrypted = "true"
    name      = "${var.name}-3"
    size      = "20"
  }
  data_disks {
    kms_key_id = alicloud_kms_key.key.id
    name       = "${var.name}-4"
    size       = "20"
    encrypted  = "true"
  }
  data_disks {
    description = "${var.name} description"
    name        = "${var.name}-5"
    size        = "20"
  }
  data_disks {
    category          = "cloud_ssd"
    name              = "${var.name}-6"
    performance_level = "PL1"
    size              = "20"
  }

  security_groups = [
    alicloud_security_group.default.0.id,
    alicloud_security_group.default.1.id
  ]
}
