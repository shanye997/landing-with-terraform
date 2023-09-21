data "alicloud_instance_types" "default" {
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "172.16.1.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = alicloud_vpc.default.id
}

data "alicloud_instance_types" "special" {
  cpu_core_count = 2
  memory_size    = 4
  spot_strategy  = "SpotWithPriceLimit"
}

resource "alicloud_ram_role" "default" {
  name     = "${var.name}"
  document = <<EOF
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
  force    = "true"
}

resource "alicloud_key_pair" "default" {
  key_pair_name = "${var.name}"
}

resource "alicloud_ecs_dedicated_host" "default" {
  dedicated_host_type   = "ddh.g6"
  description           = "From_Terraform"
  dedicated_host_name   = var.name
  action_on_maintenance = "Migrate"
  zone_id               = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
}

resource "alicloud_instance" "default" {
  internet_charge_type       = var.internet_charge_type_var
  availability_zone          = data.alicloud_instance_types.special.instance_types.0.availability_zones.0
  role_name                  = alicloud_ram_role.default.name
  key_name                   = alicloud_key_pair.default.key_name
  spot_duration              = var.spot_duration_var
  instance_type              = data.alicloud_instance_types.special.instance_types.0.id
  user_data                  = base64encode("I am the user data")
  internet_max_bandwidth_out = var.internet_max_bandwidth_out_var
  security_groups = [
    alicloud_security_group.default.id
  ]
  spot_price_limit              = "1.002"
  instance_name                 = var.name
  security_enhancement_strategy = "Active"
  dedicated_host_id             = alicloud_ecs_dedicated_host.default.id
  image_id                      = data.alicloud_images.default.images.0.id
  vswitch_id                    = alicloud_vswitch.default.id
  spot_strategy                 = "SpotWithPriceLimit"
  system_disk_category          = "cloud_efficiency"
}
