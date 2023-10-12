data "alicloud_resource_manager_resource_groups" "default" {
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "group" {
  name        = var.name
  description = "tf-eci-image-test"
  vpc_id      = data.alicloud_vpcs.default.vpcs.0.id
}

resource "alicloud_eip_address" "default" {
  address_name = var.name
}

resource "alicloud_cr_ee_instance" "default" {
  period         = 1
  renew_period   = 0
  payment_type   = "Subscription"
  instance_type  = "Advanced"
  renewal_status = "ManualRenewal"
  instance_name  = var.name
}

resource "alicloud_eci_container_group" "default" {
  eip_bandwidth     = var.eip_bandwidth_var
  insecure_registry = var.insecure_registry_var
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  containers {
    commands = [
      "/bin/sh",
      "-c",
      "sleep 9999"
    ]
    image             = "registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/nginx:alpine"
    image_pull_policy = "IfNotPresent"
    name              = "tf-examplecn-hangzhoualicloudecicontainergroup25251"
  }

  memory = var.memory_var
  volumes {
    name = "empty1"
    type = "EmptyDirVolume"
  }

  cpu             = var.cpu_var
  auto_create_eip = var.auto_create_eip_var
  host_aliases {
    hostnames = [
      "hehe.com"
    ]
    ip = "1.1.1.1"
  }

  tags = {
    Created = "TF"
    For     = "Test"
  }
  acr_registry_info {
    instance_name = alicloud_cr_ee_instance.default.instance_name
    region_id     = "cn-hangzhou"
    domains = [
      "registry.cn-hangzhou.cr.aliyuncs.com"
    ]
    instance_id = alicloud_cr_ee_instance.default.id
  }

  security_group_id   = alicloud_security_group.group.id
  eip_instance_id     = alicloud_eip_address.default.id
  restart_policy      = var.restart_policy_var
  plain_http_registry = var.plain_http_registry_var
  init_containers {
    name = "init-busybox"
    args = [
      "hello initcontainer"
    ]
    commands = [
      "echo"
    ]
    image             = "registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/busybox:1.30"
    image_pull_policy = "IfNotPresent"
  }

  auto_match_image_cache = var.auto_match_image_cache_var
  container_group_name   = "tf-examplecn-hangzhoualicloudecicontainergroup25251"
  image_registry_credential {
    password  = "tfexample"
    server    = "registry-vpc.cn-hangzhou.aliyuncs.com/google_containers/etcd:3.4.3-0"
    user_name = "tf-examplecn-hangzhouAlicloudEciContainerGroup25251"
  }

}
