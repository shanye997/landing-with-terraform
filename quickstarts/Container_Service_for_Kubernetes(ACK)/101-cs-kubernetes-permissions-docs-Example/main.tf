resource "random_integer" "default" {
  max = 99999
  min = 10000
}

variable "name" {
  default = "terraform-example"
}

variable "vpc_cidr" {
  description = "The cidr block used to launch a new vpc when 'vpc_id' is not specified."
  default     = "10.0.0.0/8"
}

variable "vswitch_cidrs" {
  description = "List of cidr blocks used to create several new vswitches when 'vswitch_ids' is not specified."
  type        = list(string)
  default     = ["10.1.0.0/16", "10.2.0.0/16"]
}

variable "pod_cidr" {
  description = "The kubernetes service cidr block. It cannot be equals to vpc's or vswitch's or service's and cannot be in them."
  default     = "172.16.0.0/16"
}

variable "service_cidr" {
  description = "The kubernetes service cidr block. It cannot be equals to vpc's or vswitch's or pod's and cannot be in them."
  default     = "192.168.0.0/16"
}

data "alicloud_enhanced_nat_available_zones" "enhanced" {}

data "alicloud_cs_kubernetes_version" "default" {
  cluster_type = "ManagedKubernetes"
}

resource "alicloud_vpc" "vpc" {
  cidr_block = var.vpc_cidr
}

# According to the vswitch cidr blocks to launch several vswitches
resource "alicloud_vswitch" "default" {
  count      = length(var.vswitch_cidrs)
  vpc_id     = alicloud_vpc.vpc.id
  cidr_block = element(var.vswitch_cidrs, count.index)
  zone_id    = data.alicloud_enhanced_nat_available_zones.enhanced.zones[count.index].zone_id
}

# Create a new RAM cluster.
resource "alicloud_cs_managed_kubernetes" "default" {
  name                 = "${var.name}-${random_integer.default.result}"
  cluster_spec         = "ack.pro.small"
  version              = data.alicloud_cs_kubernetes_version.default.metadata.0.version
  worker_vswitch_ids   = split(",", join(",", alicloud_vswitch.default.*.id))
  new_nat_gateway      = false
  pod_cidr             = var.pod_cidr
  service_cidr         = var.service_cidr
  slb_internet_enabled = false
}

# Create a new RAM user.
resource "alicloud_ram_user" "user" {
  name = "${var.name}-${random_integer.default.result}"
}

# Create a cluster permission for user.
resource "alicloud_cs_kubernetes_permissions" "default" {
  uid = alicloud_ram_user.user.id
  permissions {
    cluster     = alicloud_cs_managed_kubernetes.default.id
    role_type   = "cluster"
    role_name   = "admin"
    namespace   = ""
    is_custom   = false
    is_ram_role = false
  }
}

resource "alicloud_cs_kubernetes_permissions" "attach" {
  uid = alicloud_ram_user.user.id
  permissions {
    cluster     = alicloud_cs_managed_kubernetes.default.id
    role_type   = "namespace"
    role_name   = "cs:dev"
    namespace   = "default"
    is_custom   = true
    is_ram_role = false
  }
}