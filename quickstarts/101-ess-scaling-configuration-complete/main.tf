data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/24"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_key_pair" "default" {
  key_pair_name = "${var.name}"
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<EOF
		{
		  "Statement": [
			{
			  "Action": "sts:AssumeRole",
			  "Effect": "Allow",
			  "Principal": {
				"Service": [
				  "ecs.aliyuncs.com"
				]
			  }
			}
		  ],
		  "Version": "1"
		}
	  EOF
  description = "this is a test"
  force       = true
}

data "alicloud_instance_types" "t5" {
  instance_type_family = "ecs.t5"
  availability_zone    = "${data.alicloud_zones.default.zones.0.id}"
}

resource "alicloud_ess_scaling_group" "default" {
  min_size           = 1
  max_size           = 1
  scaling_group_name = "${var.name}"
  removal_policies   = ["OldestInstance", "NewestInstance"]
  vswitch_ids        = ["${alicloud_vswitch.default.id}"]
}

resource "alicloud_ess_scaling_configuration" "default" {
  system_disk_size = var.system_disk_size_var
  tags = {
    name = "tf-test"
  }
  system_disk_name        = var.system_disk_name_var
  system_disk_encrypted   = var.system_disk_encrypted_var
  password_inherit        = var.password_inherit_var
  system_disk_description = var.system_disk_description_var
  instance_name           = var.instance_name_var
  user_data               = var.user_data_var
  key_name                = alicloud_key_pair.default.id
  image_id                = data.alicloud_images.default1.images.0.id
  instance_types = [
    data.alicloud_instance_types.t5.instance_types.0.id,
    data.alicloud_instance_types.t5.instance_types.1.id
  ]
  internet_max_bandwidth_out = var.internet_max_bandwidth_out_var
  password                   = "123-abcABC"
  security_group_ids = [
    alicloud_security_group.default.id,
    alicloud_security_group.default1.id
  ]
  force_delete               = var.force_delete_var
  credit_specification       = var.credit_specification_var
  scaling_configuration_name = var.scaling_configuration_name_var
  internet_charge_type       = var.internet_charge_type_var
  active                     = var.active_var
  system_disk_category       = var.system_disk_category_var
  data_disk {
    category = "cloud_ssd"
    name     = var.name
    size     = "30"
  }
  data_disk {
    category    = "cloud_essd"
    description = var.name
    name        = var.name
    size        = "40"
  }

  scaling_group_id = alicloud_ess_scaling_group.default.id
  role_name        = alicloud_ram_role.default.id
}
