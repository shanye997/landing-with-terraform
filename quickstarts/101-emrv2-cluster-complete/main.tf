data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_zones" "default" {
  available_instance_type = "ecs.g7.xlarge"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vswitch" "default" {
  vpc_id       = "${alicloud_vpc.default.id}"
  cidr_block   = "172.16.0.0/21"
  zone_id      = "${data.alicloud_zones.default.zones.0.id}"
  vswitch_name = "${var.name}"
}

resource "alicloud_ecs_key_pair" "default" {
  key_pair_name = "${var.name}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_ram_role" "default" {
  name        = var.name
  document    = <<EOF
    {
        "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Effect": "Allow",
            "Principal": {
            "Service": [
                "emr.aliyuncs.com",
                "ecs.aliyuncs.com"
            ]
            }
        }
        ],
        "Version": "1"
    }
    EOF
  description = "this is a role test."
  force       = true
}

resource "alicloud_emrv2_cluster" "default" {
  node_attributes {
    key_pair_name     = alicloud_ecs_key_pair.default.id
    ram_role          = alicloud_ram_role.default.name
    security_group_id = alicloud_security_group.default.id
    vpc_id            = alicloud_vpc.default.id
    zone_id           = data.alicloud_zones.default.zones.0.id
  }

  payment_type    = "PayAsYouGo"
  cluster_type    = "DATAFLOW"
  release_version = "EMR-5.10.0"
  applications = [
    "HADOOP-COMMON",
    "HDFS",
    "YARN"
  ]
  node_groups {
    data_disks {
      size     = "90"
      category = "cloud_essd"
      count    = "3"
    }

    node_group_type      = "MASTER"
    spot_instance_remedy = "false"
    system_disk {
      category = "cloud_essd"
      size     = "80"
    }

    with_public_ip    = "false"
    graceful_shutdown = "false"
    instance_types = [
      "ecs.g7.xlarge"
    ]
    node_count      = "1"
    node_group_name = "emr-master"
    payment_type    = "PayAsYouGo"
    vswitch_ids = [
      alicloud_vswitch.default.id
    ]
  }
  node_groups {
    with_public_ip = "false"
    data_disks {
      category = "cloud_essd"
      count    = "3"
      size     = "80"
    }

    instance_types = [
      "ecs.g7.xlarge"
    ]
    node_count      = "3"
    node_group_type = "CORE"
    vswitch_ids = [
      alicloud_vswitch.default.id
    ]
    graceful_shutdown    = "false"
    node_group_name      = "emr-core"
    payment_type         = "PayAsYouGo"
    spot_instance_remedy = "false"
    system_disk {
      category = "cloud_essd"
      size     = "80"
    }

  }
  node_groups {
    payment_type = "PayAsYouGo"
    vswitch_ids = [
      alicloud_vswitch.default.id
    ]
    with_public_ip = "false"
    data_disks {
      size     = "80"
      category = "cloud_essd"
      count    = "3"
    }

    instance_types = [
      "ecs.g7.xlarge"
    ]
    node_group_name      = "emr-task"
    node_group_type      = "TASK"
    spot_instance_remedy = "false"
    system_disk {
      category = "cloud_essd"
      size     = "80"
    }

    graceful_shutdown = "false"
    node_count        = "1"
  }

  tags = {
    Created = "TF"
    For     = "acceptance test"
  }
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.ids.0
  cluster_name      = var.cluster_name_var
  deploy_mode       = "NORMAL"
}
