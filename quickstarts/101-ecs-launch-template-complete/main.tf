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
  name   = "${var.name}"
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_ecs_deployment_set" "default" {
  strategy            = "Availability"
  domain              = "Default"
  granularity         = "Host"
  deployment_set_name = var.name
  description         = var.name
}

resource "alicloud_ecs_launch_template" "default" {
  user_data                 = var.user_data_var
  internet_max_bandwidth_in = var.internet_max_bandwidth_in_var
  host_name                 = var.host_name_var
  resource_group_id         = var.resource_group_id_var
  spot_strategy             = var.spot_strategy_var
  deployment_set_id         = alicloud_ecs_deployment_set.default.id
  description               = var.description_var
  tags = {
    tag1 = "hello"
    tag2 = "world"
  }
  private_ip_address            = var.private_ip_address_var
  network_type                  = var.network_type_var
  zone_id                       = var.zone_id_var
  instance_charge_type          = var.instance_charge_type_var
  internet_max_bandwidth_out    = var.internet_max_bandwidth_out_var
  vpc_id                        = var.vpc_id_var
  security_enhancement_strategy = var.security_enhancement_strategy_var
  launch_template_name          = "tf-exampleLaunchTemplateBasic3401562032205884011"
  security_group_ids = [
    alicloud_security_group.default.id
  ]
  period              = var.period_var
  spot_price_limit    = var.spot_price_limit_var
  image_owner_alias   = var.image_owner_alias_var
  version_description = var.version_description_var
  instance_name       = var.instance_name_var
  enable_vm_os_config = var.enable_vm_os_config_var
  image_id            = data.alicloud_images.default.images.0.id
  template_tags = {

  }
  template_resource_group_id = "rg-zkdfjahg9zxncv0"
  auto_release_time          = var.auto_release_time_var
  password_inherit           = var.password_inherit_var
  ram_role_name              = var.ram_role_name_var
  key_pair_name              = var.key_pair_name_var
  io_optimized               = var.io_optimized_var
  vswitch_id                 = data.alicloud_vswitches.default.vswitches.0.id
  network_interfaces {
    description       = "hello1"
    name              = "eth0"
    primary_ip        = "10.0.0.2"
    security_group_id = "xxxx"
    vswitch_id        = "xxxxxxx"
  }

  internet_charge_type = var.internet_charge_type_var
  data_disks {
    name                 = "disk1"
    performance_level    = "PL0"
    size                 = "20"
    category             = "cloud"
    delete_with_instance = "true"
    description          = "test1"
    encrypted            = "false"
  }
  data_disks {
    name                 = "disk2"
    performance_level    = "PL0"
    size                 = "20"
    category             = "cloud"
    delete_with_instance = "true"
    description          = "test2"
    encrypted            = "false"
  }
  data_disks {
    name              = "disk2"
    performance_level = "PL1"
    category          = "cloud"
    description       = "test2"
  }
  data_disks {
    delete_with_instance = "false"
    encrypted            = "true"
    size                 = "30"
  }

  system_disk {
    category             = "cloud_ssd"
    delete_with_instance = "false"
    description          = "tf-exampleLaunchTemplateBasic3697392912986488176"
    name                 = "tf-exampleLaunchTemplateBasic3697392912986488176"
    size                 = "40"
  }

  instance_type = data.alicloud_instance_types.default.instance_types.0.id
}
