data "alicloud_zones" "default" {
  available_disk_category     = "cloud_efficiency"
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/24"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_ess_scaling_group" "default" {
  min_size           = 0
  max_size           = 1
  scaling_group_name = "${var.name}"
  removal_policies   = ["OldestInstance", "NewestInstance"]
  vswitch_ids        = ["${alicloud_vswitch.default.id}"]
  group_type         = "ECI"
}

resource "alicloud_ess_eci_scaling_configuration" "default" {
  restart_policy    = var.restart_policy_var
  egress_bandwidth  = var.egress_bandwidth_var
  security_group_id = var.security_group_id_var
  eip_bandwidth     = var.eip_bandwidth_var
  dns_policy        = var.dns_policy_var
  tags = {
    name = "tf-test"
  }
  containers {
    liveness_probe_period_seconds = "1"
    memory                        = "1"
    readiness_probe_exec_commands = [
      "cmd"
    ]
    image                        = "registry-vpc.aliyuncs.com/eci_open/alpine:3.5"
    liveness_probe_http_get_port = "1"
    ports {
      port     = "1"
      protocol = "protocol"
    }

    environment_vars {
      value = "value"
      key   = "key"
    }

    liveness_probe_exec_commands = [
      "cmd"
    ]
    liveness_probe_http_get_scheme       = "HTTP"
    liveness_probe_initial_delay_seconds = "1"
    volume_mounts {
      mount_path = "path"
      name       = "name"
      read_only  = "true"
    }

    gpu                               = "1"
    readiness_probe_period_seconds    = "1"
    readiness_probe_tcp_socket_port   = "1"
    readiness_probe_timeout_seconds   = "1"
    working_dir                       = "workingDir"
    liveness_probe_http_get_path      = "path"
    readiness_probe_http_get_port     = "1"
    readiness_probe_http_get_scheme   = "HTTP"
    readiness_probe_success_threshold = "1"
    args = [
      "arg"
    ]
    liveness_probe_success_threshold      = "1"
    liveness_probe_tcp_socket_port        = "1"
    name                                  = "name"
    readiness_probe_failure_threshold     = "1"
    readiness_probe_http_get_path         = "path"
    readiness_probe_initial_delay_seconds = "1"
    cpu                                   = "1"
    liveness_probe_failure_threshold      = "1"
    liveness_probe_timeout_seconds        = "1"
    image_pull_policy                     = "policy"
  }

  ingress_bandwidth = var.ingress_bandwidth_var
  ram_role_name     = var.ram_role_name_var
  volumes {
    disk_volume_disk_id   = "disk_volume_disk_id"
    disk_volume_disk_size = "1"
    disk_volume_fs_type   = "disk_volume_fs_type"
    flex_volume_fs_type   = "flex_volume_fs_type"
    flex_volume_options   = "flex_volume_options"
    nfs_volume_path       = "nfs_volume_path"
    nfs_volume_read_only  = "true"
    nfs_volume_server     = "nfs_volume_server"
    config_file_volume_config_file_to_paths {
      content = "content"
      path    = "path"
    }

    flex_volume_driver = "flex_volume_driver"
    name               = "name"
    type               = "type"
  }

  host_name        = var.host_name_var
  spot_price_limit = var.spot_price_limit_var
  host_aliases {
    hostnames = [
      "hostnames"
    ]
    ip = "ip"
  }

  enable_sls       = var.enable_sls_var
  memory           = var.memory_var
  auto_create_eip  = var.auto_create_eip_var
  scaling_group_id = alicloud_ess_scaling_group.default.id
  init_containers {
    image_pull_policy = "policy"
    ports {
      port     = "1"
      protocol = "protocol"
    }

    args = [
      "arg"
    ]
    cpu    = "1"
    gpu    = "1"
    image  = "registry-vpc.aliyuncs.com/eci_open/alpine:3.5"
    memory = "1"
    name   = "name"
    volume_mounts {
      mount_path = "path"
      name       = "name"
      read_only  = "true"
    }

    working_dir = "workingDir"
    commands = [
      "cmd"
    ]
    environment_vars {
      key   = "key"
      value = "value"
    }

  }

  spot_strategy = var.spot_strategy_var
  image_registry_credentials {
    server   = "server"
    username = "username"
    password = "password"
  }

  container_group_name       = var.container_group_name_var
  scaling_configuration_name = var.scaling_configuration_name_var
  description                = var.description_var
  acr_registry_infos {
    region_id = "cn-hangzhou"
    domains = [
      "test-registry-vpc.cn-hangzhou.cr.aliyuncs.com"
    ]
    instance_id   = "cri-47rme9691uiowvfv"
    instance_name = "zzz"
  }

  resource_group_id = var.resource_group_id_var
  cpu               = var.cpu_var
}
