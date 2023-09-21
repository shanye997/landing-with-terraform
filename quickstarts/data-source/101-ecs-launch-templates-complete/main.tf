data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_security_group" "default" {
  name   = "tf-example58693"
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_ecs_launch_template" "default" {
  name                          = "tf-example58693"
  description                   = "tf-example58693"
  image_id                      = "${data.alicloud_images.default.images.0.id}"
  host_name                     = "tf-example58693"
  instance_charge_type          = "PrePaid"
  instance_name                 = "tf-example58693"
  instance_type                 = "${data.alicloud_instance_types.default.instance_types.0.id}"
  internet_charge_type          = "PayByBandwidth"
  internet_max_bandwidth_in     = "5"
  internet_max_bandwidth_out    = "0"
  io_optimized                  = "optimized"
  key_pair_name                 = "tf-example58693"
  ram_role_name                 = "tf-example58693"
  network_type                  = "vpc"
  security_enhancement_strategy = "Active"
  spot_price_limit              = "5"
  spot_strategy                 = "SpotWithPriceLimit"
  security_group_id             = "${alicloud_security_group.default.id}"
  system_disk {
    category             = "cloud_ssd"
    description          = "tf-example58693"
    name                 = "tf-example58693"
    size                 = "40"
    delete_with_instance = "false"
  }

  resource_group_id = "rg-zkdfjahg9zxncv0"
  user_data         = "xxxxxxx"
  vswitch_id        = "${data.alicloud_vswitches.default.vswitches.0.id}"
  vpc_id            = "vpc-asdfnbg0as8dfk1nb2"
  zone_id           = "cn-hangzhou-i"

  template_tags = {
    tag1 = "hello"
    tag2 = "world"
  }

  network_interfaces {
    name              = "eth0"
    description       = "hello1"
    primary_ip        = "10.0.0.2"
    security_group_id = "xxxx"
    vswitch_id        = "xxxxxxx"
  }

  data_disks {
    name                 = "disk1"
    description          = "test1"
    delete_with_instance = "true"
    category             = "cloud"
    encrypted            = "false"
    performance_level    = "PL0"
    size                 = "20"
  }
  data_disks {
    name                 = "disk2"
    description          = "test2"
    delete_with_instance = "true"
    category             = "cloud"
    encrypted            = "false"
    performance_level    = "PL0"
    size                 = "20"
  }
}

data "alicloud_ecs_launch_templates" "default" {
  template_tags = {

  }
  enable_details = var.enable_details_var
  name_regex     = "${alicloud_ecs_launch_template.default.name}-fake"
  ids = [
    alicloud_ecs_launch_template.default.id
  ]
}
