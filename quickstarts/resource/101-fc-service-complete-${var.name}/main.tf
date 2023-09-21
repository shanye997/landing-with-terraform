resource "alicloud_log_project" "default" {
  name = "${var.name}"
}

resource "alicloud_log_store" "default" {
  project = "${alicloud_log_project.default.name}"
  name    = "${var.name}"
}

data "alicloud_vpcs" "default" {
  name_regex = "^default-NODELETING$"
}

resource "alicloud_security_group" "default" {
  name   = "${var.name}"
  vpc_id = "${data.alicloud_vpcs.default.ids.0}"
}

resource "alicloud_nas_file_system" "this" {
  protocol_type = "NFS"
  storage_type  = "Performance"
}

resource "alicloud_nas_access_group" "this" {
  access_group_name = "${var.name}"
  access_group_type = "Vpc"
}

resource "alicloud_nas_mount_target" "this" {
  count             = 2
  access_group_name = alicloud_nas_access_group.this.access_group_name
  file_system_id    = alicloud_nas_file_system.this.id
  vswitch_id        = data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
}

locals {
  mount_target_domain = format("%s://mnt", split(":", alicloud_nas_mount_target.this[0].id)[1])
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

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_fc_service" "default" {
  internet_access = var.internet_access_var
  publish         = var.publish_var
  log_config {
    enable_request_metrics  = "true"
    logstore                = alicloud_log_store.default.name
    project                 = alicloud_log_store.default.project
    enable_instance_metrics = "true"
  }

  name = var.name
  role = alicloud_ram_role.default.arn
  depends_on = [
    alicloud_ram_role_policy_attachment.default
  ]
  description = var.description_var
  nas_config {
    group_id = "9528"
    mount_points {
      mount_dir   = "/mnt/nas"
      server_addr = local.mount_target_domain
    }

    user_id = "9527"
  }

  vpc_config {
    security_group_id = alicloud_security_group.default.id
    vswitch_ids = [
      data.alicloud_vpcs.default.vpcs.0.vswitch_ids.0
    ]
  }

}
