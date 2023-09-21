resource "alicloud_log_project" "default" {
  name = "${var.name}-project"
}

resource "alicloud_log_store" "default" {
  project = "${alicloud_log_project.default.name}"
  name    = "${var.name}-store"
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<DEFINITION
    {
        "Statement": [
            {
                "Action": "sts:AssumeRole",
                "Effect": "Allow",
                "Principal": {
                    "Service": [
                        "fc.aliyuncs.com"
                    ]
                }
            }
        ],
        "Version": "1"
    }
    DEFINITION
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_policy" "default" {
  name     = "${var.name}"
  document = <<DEFINITION
	{
		"Version": "1",
		"Statement": [
		  {
			"Action": "vpc:*",
			"Resource": "*",
			"Effect": "Allow"
		  },
		  {
			"Action": [
			  "ecs:*NetworkInterface*"
			],
			"Resource": "*",
			"Effect": "Allow"
		  }
		]
	}
	DEFINITION
}

resource "alicloud_ram_role_policy_attachment" "vpc" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "${alicloud_ram_policy.default.name}"
  policy_type = "Custom"
}

resource "alicloud_ram_role_policy_attachment" "log" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_vpc" "default" {
  vpc_name   = "${var.name}"
  cidr_block = "172.16.0.0/16"
}

data "alicloud_zones" "default" {
  available_resource_creation = "FunctionCompute"
}

resource "alicloud_vswitch" "default" {
  name              = "${var.name}"
  cidr_block        = "172.16.0.0/24"
  availability_zone = "${data.alicloud_zones.default.zones.0.id}"
  vpc_id            = "${alicloud_vpc.default.id}"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${alicloud_vpc.default.id}"
}

resource "alicloud_fc_service" "default" {
  name        = "${var.name}"
  description = "${var.name}-description"
  log_config {
    project  = "${alicloud_log_store.default.project}"
    logstore = "${alicloud_log_store.default.name}"
  }
  vpc_config {
    security_group_id = "${alicloud_security_group.default.id}"
    vswitch_ids       = "${alicloud_vswitch.default.*.id}"
  }
  nas_config {
    user_id  = 2011
    group_id = 9527
    mount_points {
      server_addr = "x-nas.aliyuncs.com:/dir"
      mount_dir   = "/mnt/nas"
    }
  }
  role            = "${alicloud_ram_role.default.arn}"
  depends_on      = ["alicloud_ram_role_policy_attachment.vpc", "alicloud_ram_role_policy_attachment.log"]
  internet_access = true
}

data "alicloud_fc_services" "default" {
  name_regex = "${alicloud_fc_service.default.name}_fake"
  ids = [
    alicloud_fc_service.default.service_id
  ]
}
