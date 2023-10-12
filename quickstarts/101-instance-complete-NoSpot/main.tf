data "alicloud_zones" default {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone                 = data.alicloud_zones.default.zones[0].id
  system_disk_category              = "cloud_efficiency"
  cpu_core_count                    = 4
  minimum_eni_ipv6_address_quantity = 1
}

resource "alicloud_vpc" "vpc" {
  vpc_name    = var.name
  cidr_block  = "172.16.0.0/16"
  enable_ipv6 = "true"
}

resource "alicloud_vswitch" "vswitch" {
  vswitch_name         = var.name
  cidr_block           = "172.16.0.0/24"
  zone_id              = data.alicloud_zones.default.zones.0.id
  vpc_id               = alicloud_vpc.vpc.id
  ipv6_cidr_block_mask = "22"
}

data "alicloud_images" "default" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = alicloud_vpc.vpc.id
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

resource "alicloud_vpc" "default" {
  vpc_name = var.name
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 8)
  vswitch_name = var.name
}

provider "alicloud" {
  assume_role {}
}

resource "alicloud_instance" "default" {
  operator_type        = var.operator_type_var
  role_name            = alicloud_ram_role.default.name
  auto_renew_period    = var.auto_renew_period_var
  instance_charge_type = var.instance_charge_type_var
  instance_name        = var.name
  availability_zone    = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  user_data            = base64encode("I am the user data")
  volume_tags = {

  }
  host_name                     = var.host_name_var
  system_disk_category          = "cloud_efficiency"
  key_name                      = alicloud_key_pair.default.key_name
  include_data_disks            = var.include_data_disks_var
  spot_price_limit              = "0"
  internet_max_bandwidth_out    = var.internet_max_bandwidth_out_var
  vswitch_id                    = alicloud_vswitch.vswitch.id
  spot_strategy                 = "NoSpot"
  internet_charge_type          = var.internet_charge_type_var
  force_delete                  = var.force_delete_var
  period_unit                   = var.period_unit_var
  description                   = var.description_var
  security_enhancement_strategy = "Active"
  renewal_status                = var.renewal_status_var
  period                        = var.period_var
  dry_run                       = var.dry_run_var
  system_disk_size              = var.system_disk_size_var
  security_groups = [
    alicloud_security_group.default.id
  ]
  ipv6_address_count = "1"
  image_id           = data.alicloud_images.default.images.0.id
  instance_type      = data.alicloud_instance_types.default.instance_types.0.id
  private_ip         = cidrhost(alicloud_vswitch.default.cidr_block, 100)
  tags = {
    bar = "bar"
    foo = "foo"
  }
  password = var.password_var
}
