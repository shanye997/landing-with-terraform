data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "group" {
  name        = var.name
  description = "tf-eci-image-test"
  vpc_id      = data.alicloud_vpcs.default.vpcs.0.id
}

resource "alicloud_eci_container_group" "default" {
  containers {
    image_pull_policy = "IfNotPresent"
    name              = "tf-examplecn-hangzhoualicloudecicontainergroup25251"
    commands = [
      "/bin/sh",
      "-c",
      "sleep 9999"
    ]
    image = "registry-vpc.cn-hangzhou.aliyuncs.com/eci_open/nginx:alpine"
  }

  image_registry_credential {
    user_name = "tf-examplecn-hangzhouAlicloudEciContainerGroup25251"
    password  = "tfexample"
    server    = "registry-vpc.cn-hangzhou.aliyuncs.com/google_containers/etcd:3.4.3-0"
  }

  security_group_id    = alicloud_security_group.group.id
  container_group_name = "tf-examplecn-hangzhoualicloudecicontainergroup25251"
  vswitch_id           = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
}
