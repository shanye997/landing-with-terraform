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

resource "alicloud_ram_user" "default" {
  name         = var.name
  display_name = var.name
  mobile       = "86-18688888888"    # replace to your tel
  email        = "hello.uuu@aaa.com" # replace to your email
  comments     = "yoyoyo"
  force        = true
}

resource "alicloud_ram_policy" "default" {
  policy_name     = var.name
  policy_document = <<EOF
  {
    "Statement": [
      {
        "Action": [
          "cs:Get*",
          "cs:List*",
          "cs:Describe*"
        ],
        "Effect": "Allow",
        "Resource": [
          "acs:cs:*:*:cluster/${alicloud_cs_managed_kubernetes.default.id}"
        ]
      }
    ],
    "Version": "1"
  }
  EOF
  description     = "this is a policy test by tf"
  force           = true
}

resource "alicloud_ram_user_policy_attachment" "default" {
  policy_name = alicloud_ram_policy.default.name
  policy_type = alicloud_ram_policy.default.type
  user_name   = alicloud_ram_user.default.name
}

resource "alicloud_cs_kubernetes_permissions" "default" {
  uid = alicloud_ram_user_policy_attachment.default.user_name
  permissions {
    cluster     = alicloud_cs_managed_kubernetes.default.id
    role_type   = "cluster"
    role_name   = "dev"
    namespace   = ""
    is_custom   = false
    is_ram_role = false
  }
}


#If you already have users and clusters, to complete RBAC authorization, you only need to run the following code to use Terraform. 
locals {
  cluster_id = alicloud_cs_managed_kubernetes.default.id
  user_name  = alicloud_ram_user.default.id
}

resource "alicloud_ram_policy" "policy" {
  policy_name     = "AckClusterReadOnlyAccess"
  policy_document = <<EOF
  {
    "Statement": [
      {
        "Action": [
          "cs:Get*",
          "cs:List*",
          "cs:Describe*"
        ],
        "Effect": "Allow",
        "Resource": [
          "acs:cs:*:*:cluster/${local.cluster_id}"
        ]
      }
    ],
    "Version": "1"
  }
  EOF
  description     = "this is a policy test by tf"
  force           = true
}

resource "alicloud_ram_user_policy_attachment" "attach" {
  policy_name = alicloud_ram_policy.policy.name
  policy_type = alicloud_ram_policy.policy.type
  user_name   = local.user_name
}

resource "alicloud_cs_kubernetes_permissions" "already_attach" {
  uid = alicloud_ram_user_policy_attachment.attach.user_name
  permissions {
    cluster     = local.cluster_id
    role_type   = "cluster"
    role_name   = "ops"
    is_custom   = false
    is_ram_role = false
    namespace   = ""
  }
}

# Remove user permissions,Remove the current user's permissions on the cluster
resource "alicloud_cs_kubernetes_permissions" "remove_permissions" {
  uid = alicloud_cs_kubernetes_permissions.already_attach.uid
}