data "alicloud_zones" default {
  available_resource_creation = "VSwitch"
}

data "alicloud_instance_types" "default" {
  availability_zone    = data.alicloud_zones.default.zones.0.id
  cpu_core_count       = 4
  memory_size          = 8
  kubernetes_node_role = "Worker"
}

resource "alicloud_vpc" "default" {
  name       = var.name
  cidr_block = "10.1.0.0/21"
}

resource "alicloud_vswitch" "default" {
  name              = var.name
  vpc_id            = alicloud_vpc.default.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_cs_managed_kubernetes" "default" {
  worker_instance_types       = [data.alicloud_instance_types.default.instance_types.0.id]
  name                        = var.name
  cluster_spec                = "ack.pro.small"
  worker_vswitch_ids          = [alicloud_vswitch.default.id]
  worker_number               = "2"
  password                    = "Test12345"
  pod_cidr                    = "172.20.0.0/16"
  service_cidr                = "172.21.0.0/20"
  worker_disk_size            = "50"
  worker_disk_category        = "cloud_ssd"
  worker_data_disk_size       = "20"
  worker_data_disk_category   = "cloud_ssd"
  worker_instance_charge_type = "PostPaid"
  slb_internet_enabled        = "true"
}

resource "alicloud_edas_k8s_cluster" "default" {
  cs_cluster_id = alicloud_cs_managed_kubernetes.default.id
}

resource "alicloud_edas_k8s_application" "default" {
  application_name = var.name
  cluster_id       = alicloud_edas_k8s_cluster.default.id
  package_type     = "FatJar"
  package_url      = "http://edas-bj.oss-cn-beijing.aliyuncs.com/prod/demo/SPRING_CLOUD_PROVIDER.jar"
  jdk              = "Open JDK 8"
  replicas         = "1"
}

resource "alicloud_edas_k8s_slb_attachment" "default" {
  slb_configs {
    scheduler = "rr"
    type      = "internet"
    port_mappings {
      service_port {
        port        = "81"
        protocol    = "TCP"
        target_port = "18081"
      }

      loadbalancer_protocol = "TCP"
    }
    port_mappings {
      loadbalancer_protocol = "TCP"
      service_port {
        port        = "8081"
        protocol    = "TCP"
        target_port = "18081"
      }

    }

  }

  app_id = alicloud_edas_k8s_application.default.id
}
