variable "name" {
  default = "tf-example"
}
data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}
data "alicloud_images" "default" {
  name_regex  = "^ubuntu_18.*64"
  most_recent = true
  owners      = "system"
}
data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
}

resource "alicloud_vpc" "default" {
  vpc_name   = var.name
  cidr_block = "10.4.0.0/16"
}
resource "alicloud_vswitch" "default" {
  vswitch_name = var.name
  cidr_block   = "10.4.0.0/24"
  vpc_id       = alicloud_vpc.default.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_cs_managed_kubernetes" "default" {
  name_prefix          = var.name
  cluster_spec         = "ack.pro.small"
  worker_vswitch_ids   = [alicloud_vswitch.default.id]
  new_nat_gateway      = true
  pod_cidr             = cidrsubnet("10.0.0.0/8", 8, 36)
  service_cidr         = cidrsubnet("172.16.0.0/16", 4, 7)
  slb_internet_enabled = true
}

resource "alicloud_cs_kubernetes_node_pool" "default" {
  name                 = var.name
  cluster_id           = alicloud_cs_managed_kubernetes.default.id
  vswitch_ids          = [alicloud_vswitch.default.id]
  instance_types       = [data.alicloud_instance_types.default.instance_types.0.id]
  system_disk_category = "cloud_efficiency"
  system_disk_size     = 40
  desired_size         = 2
}
resource "alicloud_edas_k8s_cluster" "default" {
  cs_cluster_id = alicloud_cs_kubernetes_node_pool.default.cluster_id
}

resource "alicloud_edas_k8s_application" "default" {
  application_name        = var.name
  cluster_id              = alicloud_edas_k8s_cluster.default.id
  package_type            = "FatJar"
  package_url             = "http://edas-bj.oss-cn-beijing.aliyuncs.com/prod/demo/SPRING_CLOUD_PROVIDER.jar"
  jdk                     = "Open JDK 8"
  replicas                = 2
  readiness               = "{\"failureThreshold\": 3,\"initialDelaySeconds\": 5,\"successThreshold\": 1,\"timeoutSeconds\": 1,\"tcpSocket\":{\"port\":18081}}"
  liveness                = "{\"failureThreshold\": 3,\"initialDelaySeconds\": 5,\"successThreshold\": 1,\"timeoutSeconds\": 1,\"tcpSocket\":{\"port\":18081}}"
  application_descriotion = var.name
}

resource "alicloud_edas_k8s_slb_attachment" "default" {
  app_id = alicloud_edas_k8s_application.default.id
  slb_configs {
    type      = "internet"
    scheduler = "rr"
    port_mappings {
      loadbalancer_protocol = "TCP"
      service_port {
        port        = 80
        protocol    = "TCP"
        target_port = 8080
      }
    }
  }
}