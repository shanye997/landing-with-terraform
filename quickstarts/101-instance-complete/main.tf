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

resource "alicloud_key_pair" "default" {
  key_name = "${var.name}"
}

data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name = var.name
}

resource "alicloud_vswitch" "default" {
  vpc_id       = alicloud_vpc.default.id
  zone_id      = reverse(data.alicloud_zones.default.zones).1.id
  cidr_block   = cidrsubnet(alicloud_vpc.default.cidr_block, 8, 8)
  vswitch_name = var.name
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
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

resource "alicloud_kms_key" "key" {
  description            = var.name
  pending_window_in_days = "7"
  key_state              = "Enabled"
}

resource "alicloud_ecs_hpc_cluster" "default" {
  name        = "${var.name}"
  description = "For Terraform Test"
}

resource "alicloud_instance" "default" {
  resource_group_id             = var.resource_group_id
  spot_strategy                 = "NoSpot"
  http_endpoint                 = var.http_endpoint_var
  password                      = var.password_var
  spot_price_limit              = "0"
  system_disk_category          = "cloud_efficiency"
  private_ip                    = cidrhost(data.alicloud_vswitches.default.vswitches.0.cidr_block, 100)
  instance_name                 = var.instance_name_var
  http_put_response_hop_limit   = "2"
  system_disk_name              = var.system_disk_name_var
  image_id                      = data.alicloud_images.default.images.1.id
  internet_max_bandwidth_out    = var.internet_max_bandwidth_out_var
  system_disk_description       = var.system_disk_description_var
  system_disk_size              = var.system_disk_size_var
  internet_charge_type          = var.internet_charge_type_var
  instance_type                 = data.alicloud_instance_types.default.instance_types.0.id
  security_enhancement_strategy = "Active"
  data_disks {
    device = "/dev/xvdb"
    name   = "${var.name}-1"
    size   = "20"
  }
  data_disks {
    size     = "20"
    category = "cloud_ssd"
    name     = "${var.name}-2"
  }
  data_disks {
    encrypted = "true"
    name      = "${var.name}-3"
    size      = "20"
  }
  data_disks {
    encrypted  = "true"
    kms_key_id = alicloud_kms_key.key.id
    name       = "${var.name}-4"
    size       = "20"
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

  instance_charge_type = var.instance_charge_type_var
  ipv6_addresses = [
    cidrhost(alicloud_vswitch.vswitch.ipv6_cidr_block, 64)
  ]
  user_data = base64encode("I am the user data")
  security_groups = [
    alicloud_security_group.default.0.id,
    alicloud_security_group.default.1.id
  ]
  auto_release_time = var.auto_release_time_var
  key_name          = alicloud_key_pair.default.key_name
  vswitch_id        = alicloud_vswitch.default.id
  status            = var.status_var
  tags = {
    tag3 = "value3"
    tag5 = "value5"
    tag6 = "value6"
    tagC = "valueC"
    tagD = "valueD"
    tagG = "valueG"
    tag1 = "value1"
    tag2 = "value2"
    tag4 = "value4"
    tagF = "valueF"
    tagH = "valueH"
    Bar  = "Bar"
    tag7 = "value7"
    tag8 = "value8"
    tag9 = "value9"
    tagA = "valueA"
    tagB = "valueB"
    foo  = "foo"
    tag0 = "value0"
    tagE = "valueE"
  }
  http_tokens       = var.http_tokens_var
  availability_zone = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  role_name         = alicloud_ram_role.default.name
  volume_tags = {

  }
  hpc_cluster_id      = alicloud_ecs_hpc_cluster.default.id
  force_delete        = var.force_delete_var
  description         = var.description_var
  host_name           = var.host_name_var
  deletion_protection = var.deletion_protection_var
  stopped_mode        = var.stopped_mode_var
}
