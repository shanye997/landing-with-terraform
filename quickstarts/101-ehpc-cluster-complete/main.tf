data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_zones.default.zones.0.id
}

data "alicloud_instance_types" "default" {
  availability_zone = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_nas_file_system" "default" {
  storage_type  = var.storage_type
  protocol_type = "NFS"
}

resource "alicloud_nas_mount_target" "default" {
  file_system_id    = alicloud_nas_file_system.default.id
  access_group_name = "DEFAULT_VPC_GROUP_NAME"
  vswitch_id        = data.alicloud_vswitches.default.ids.0
}

resource "alicloud_nas_file_system" "default1" {
  storage_type  = var.storage_type
  protocol_type = "NFS"
}

resource "alicloud_nas_mount_target" "default1" {
  file_system_id    = alicloud_nas_file_system.default1.id
  access_group_name = "DEFAULT_VPC_GROUP_NAME"
  vswitch_id        = data.alicloud_vswitches.default.ids.0
}

data "alicloud_images" "default" {
  name_regex = "^centos_7_6_x64*"
  owners     = "system"
}

resource "alicloud_ehpc_cluster" "default" {
  cluster_version       = var.cluster_version_var
  manager_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  os_tag                = "CentOS_7.6_64"
  description           = "${var.name}"
  zone_id               = data.alicloud_zones.default.zones.0.id
  login_instance_type   = data.alicloud_instance_types.default.instance_types.0.id
  scheduler_type        = "pbs"
  manager_count         = "1"
  client_version        = "1.0.1"
  ehpc_version          = var.ehpc_version_var
  security_group_name   = var.name
  ram_node_types = [
    "manager"
  ]
  system_disk_type  = var.system_disk_type_var
  volume_mountpoint = alicloud_nas_mount_target.default.mount_target_domain
  volume_id         = alicloud_nas_file_system.default.id
  cluster_name      = "${var.name}"
  post_install_script {
    args = "bashfile.sh"
    url  = "/opt/job.sh"
  }

  additional_volumes {
    volume_id           = alicloud_nas_file_system.default1.id
    volume_mount_option = "-t nfs -o vers=4.0"
    volume_type         = "nas"
    location            = "PublicCloud"
    roles {
      name = "Compute"
    }

    remote_directory  = "/test"
    volume_mountpoint = alicloud_nas_mount_target.default1.mount_target_domain
    volume_protocol   = "nfs"
    job_queue         = "high"
    local_directory   = "/ff"
  }

  login_count = "1"
  password    = "your-password123"
  application {
    tag = "singularity_3.8.3"
  }

  without_elastic_ip    = var.without_elastic_ip_var
  volume_type           = "nas"
  system_disk_level     = var.system_disk_level_var
  compute_instance_type = data.alicloud_instance_types.default.instance_types.0.id
  volume_protocol       = "nfs"
  image_owner_alias     = var.image_owner_alias_var
  deploy_mode           = "Simple"
  is_compute_ess        = var.is_compute_ess_var
  ha_enable             = "false"
  compute_count         = "1"
  vswitch_id            = data.alicloud_vswitches.default.ids.0
  image_id              = data.alicloud_images.default.images.0.id
  remote_directory      = "/"
  system_disk_size      = var.system_disk_size_var
  volume_mount_option   = var.volume_mount_option_var
  vpc_id                = data.alicloud_vpcs.default.ids.0
  remote_vis_enable     = var.remote_vis_enable_var
  without_agent         = var.without_agent_var
  resource_group_id     = data.alicloud_resource_manager_resource_groups.default.ids.0
  account_type          = "nis"
  ecs_charge_type       = "PostPaid"
}
