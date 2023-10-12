data "alicloud_instance_types" "default" {
  cpu_core_count = 1
  memory_size    = 2
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

data "alicloud_vswitches" "default" {
  vpc_id  = data.alicloud_vpcs.default.ids.0
  zone_id = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
}

resource "alicloud_vswitch" "vswitch" {
  count        = length(data.alicloud_vswitches.default.ids) > 0 ? 0 : 1
  vpc_id       = data.alicloud_vpcs.default.ids.0
  cidr_block   = cidrsubnet(data.alicloud_vpcs.default.vpcs[0].cidr_block, 8, 8)
  zone_id      = data.alicloud_instance_types.default.instance_types.0.availability_zones.0
  vswitch_name = var.name
}

locals {
  vswitch_id = length(data.alicloud_vswitches.default.ids) > 0 ? data.alicloud_vswitches.default.ids[0] : concat(alicloud_vswitch.vswitch.*.id, [""])[0]
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_instance" "default" {
  instance_type              = "${data.alicloud_instance_types.default.instance_types.0.id}"
  system_disk_category       = "cloud_efficiency"
  image_id                   = "centos_7_06_64_20G_alibase_20190711.vhd"
  instance_name              = "${var.name}"
  vswitch_id                 = local.vswitch_id
  security_groups            = ["${alicloud_security_group.default.id}"]
  internet_max_bandwidth_out = 10
}

resource "alicloud_edas_cluster" "default" {
  cluster_name = "${var.name}"
  cluster_type = 2
  network_mode = 2
  vpc_id       = data.alicloud_vpcs.default.ids.0
}

resource "alicloud_edas_instance_cluster_attachment" "default" {
  cluster_id   = "${alicloud_edas_cluster.default.id}"
  instance_ids = ["${alicloud_instance.default.id}"]
}

resource "alicloud_edas_application" "default" {
  application_name = "${var.name}"
  cluster_id       = "${alicloud_edas_cluster.default.id}"
  package_type     = "JAR"
  ecu_info         = ["${alicloud_edas_instance_cluster_attachment.default.ecu_map[alicloud_instance.default.id]}"]
}

resource "alicloud_edas_application_deployment" "default" {
  group_id = "all"
  war_url  = "http://edas-sz.oss-cn-shenzhen.aliyuncs.com/prod/demo/SPRING_CLOUD_CONSUMER.jar"
  app_id   = alicloud_edas_application.default.id
}
