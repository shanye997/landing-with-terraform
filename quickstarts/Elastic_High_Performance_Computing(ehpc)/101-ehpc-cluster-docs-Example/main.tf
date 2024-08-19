variable "name" {
  default = "tf-example"
}
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}
data "alicloud_images" "default" {
  name_regex = "^centos_7_6_x64*"
  owners     = "system"
}
data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.0.0.0/8"
}
resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.1.0.0/16"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_nas_file_system" "default" {
  storage_type  = "Performance"
  protocol_type = "NFS"
}
resource "alicloud_nas_mount_target" "default" {
  file_system_id    = alicloud_nas_file_system.default.id
  access_group_name = "DEFAULT_VPC_GROUP_NAME"
  vswitch_id        = alicloud_vswitch.default.id
}

resource "alicloud_ehpc_cluster" "default" {
  cluster_name          = var.name
  deploy_mode           = "Simple"
  description           = var.name
  ha_enable             = false
  image_id              = data.alicloud_images.default.images.0.id
  image_owner_alias     = "system"
  volume_protocol       = "nfs"
  volume_id             = alicloud_nas_file_system.default.id
  volume_mountpoint     = alicloud_nas_mount_target.default.mount_target_domain
  compute_count         = 1
  compute_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  login_count           = 1
  login_instance_type   = data.alicloud_instance_types.default.instance_types.0.id
  manager_count         = 1
  manager_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  os_tag                = "CentOS_7.6_64"
  scheduler_type        = "pbs"
  password              = "your-password123"
  vswitch_id            = alicloud_vswitch.default.id
  vpc_id                = alicloud_vpc.default.id
  zone_id               = data.alicloud_zones.default.zones.0.id
}