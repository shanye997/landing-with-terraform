data "alicloud_zones" "example" {
  available_resource_creation = "Instance"
}

data "alicloud_instance_types" "example" {
  availability_zone = data.alicloud_zones.example.zones.0.id
  cpu_core_count    = 1
  memory_size       = 2
}

data "alicloud_images" "example" {
  name_regex = "^ubuntu_[0-9]+_[0-9]+_x64*"
  owners     = "system"
}



resource "alicloud_vpc" "example" {
  vpc_name   = "terraform-example"
  cidr_block = "172.17.3.0/24"
}

resource "alicloud_vswitch" "example" {
  vswitch_name = "terraform-example"
  cidr_block   = "172.17.3.0/24"
  vpc_id       = alicloud_vpc.example.id
  zone_id      = data.alicloud_zones.example.zones.0.id
}

resource "alicloud_security_group" "example" {
  name   = "terraform-example"
  vpc_id = alicloud_vpc.example.id
}

resource "alicloud_instance" "example" {
  image_id             = data.alicloud_images.example.images.0.id
  instance_type        = data.alicloud_instance_types.example.instance_types.0.id
  availability_zone    = data.alicloud_zones.example.zones.0.id
  security_groups      = [alicloud_security_group.example.id]
  instance_name        = "terraform-example"
  internet_charge_type = "PayByBandwidth"
  vswitch_id           = alicloud_vswitch.example.id
}


data "alicloud_resource_manager_resource_groups" "example" {
  status = "OK"
}

resource "alicloud_hbr_vault" "example" {
  vault_name = "terraform-example"
}

resource "alicloud_hbr_hana_instance" "example" {
  alert_setting        = "INHERITED"
  hana_name            = "terraform-example"
  host                 = "1.1.1.1"
  instance_number      = 1
  password             = "YouPassword123"
  resource_group_id    = data.alicloud_resource_manager_resource_groups.example.groups.0.id
  sid                  = "HXE"
  use_ssl              = false
  user_name            = "admin"
  validate_certificate = false
  vault_id             = alicloud_hbr_vault.example.id
}

resource "alicloud_hbr_hana_backup_client" "default" {
  vault_id      = alicloud_hbr_vault.example.id
  client_info   = "[ { \"instanceId\": \"${alicloud_instance.example.id}\", \"clusterId\": \"${alicloud_hbr_hana_instance.example.hana_instance_id}\", \"sourceTypes\": [ \"HANA\" ]  }]"
  alert_setting = "INHERITED"
  use_https     = true
}