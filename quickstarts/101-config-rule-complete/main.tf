resource "alicloud_resource_manager_resource_group" "example" {
  count               = 2
  resource_group_name = join("-", [var.name, count.index])
  display_name        = join("-", [var.name, count.index])
}

data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu"
  most_recent = true
  owners      = "system"
}

resource "alicloud_vpc" "foo" {
  cidr_block = "172.16.0.0/12"
  name       = "${var.name}"
}

resource "alicloud_vswitch" "foo" {
  vpc_id            = "${alicloud_vpc.foo.id}"
  cidr_block        = "172.16.0.0/21"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  name              = "${var.name}"
}

resource "alicloud_security_group" "tf_test_foo" {
  name        = "${var.name}"
  description = "foo"
  vpc_id      = "${alicloud_vpc.foo.id}"
}

resource "alicloud_instance" "default" {
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_id        = "${alicloud_vswitch.foo.id}"
  image_id          = "${data.alicloud_images.default.images.0.id}"
  # series III
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  system_disk_category       = "cloud_efficiency"
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = 5
  security_groups            = ["${alicloud_security_group.tf_test_foo.id}"]
  instance_name              = "${var.name}"
  user_data                  = "echo 'net.ipv4.ip_forward=1'>> /etc/sysctl.conf"
}

data "alicloud_instances" "default" {
  name_regex = "${alicloud_instance.default.instance_name}"
}

resource "alicloud_config_rule" "default" {
  rule_name                  = "tf-exampleConfigRule7879870"
  description                = var.description_var
  risk_level                 = var.risk_level_var
  tag_value_scope            = var.tag_value_scope_var
  source_owner               = "ALIYUN"
  region_ids_scope           = var.region_ids_scope_var
  status                     = var.status_var
  exclude_resource_ids_scope = data.alicloud_instances.default.instances[0].id
  config_rule_trigger_types  = var.config_rule_trigger_types_var
  resource_group_ids_scope   = alicloud_resource_manager_resource_group.example[1].id
  tag_key_scope              = var.tag_key_scope_var
  input_parameters = {

  }
  source_identifier = "ecs-instances-in-vpc"
  resource_types_scope = [
    "ACS::ECS::Instance"
  ]
}
