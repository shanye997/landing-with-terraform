data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  instance_type_family = "ecs.sn1ne"
}

data "alicloud_images" "default" {
  name_regex  = "^ubuntu_[0-9]+_[0-9]+_x64*"
  most_recent = true
  owners      = "system"
}

data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_security_group" "default" {
  name   = var.name
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  image_id                   = data.alicloud_images.default.images.0.id
  instance_type              = data.alicloud_instance_types.default.instance_types.0.id
  instance_name              = var.name
  security_groups            = alicloud_security_group.default.*.id
  internet_charge_type       = "PayByTraffic"
  internet_max_bandwidth_out = "10"
  availability_zone          = data.alicloud_zones.default.zones.0.id
  instance_charge_type       = "PostPaid"
  password                   = "YourPassword12345!"
  system_disk_category       = "cloud_efficiency"
  vswitch_id                 = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_kms_secret" "default" {
  version_id = var.version_id_var
  version_stages = [
    "ACSCurrent",
    "UStage1"
  ]
  secret_data                   = var.secret_data_var
  secret_name                   = "tf_exampleKmsSecret_5076908"
  extended_config               = "{\"CommandId\":\"\",\"CustomData\":{\"test\":\"test\"},\"InstanceId\":\"${alicloud_instance.default.id}\",\"RegionId\":\"cn-hangzhou\",\"SecretSubType\":\"Password\"}"
  secret_type                   = "ECS"
  description                   = var.description_var
  force_delete_without_recovery = var.force_delete_without_recovery_var
  secret_data_type              = var.secret_data_type_var
  tags = {
    Description = "tf_exampleKmsSecret_5076908"
    usage       = "acceptanceTest"
  }
}
