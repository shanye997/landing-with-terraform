resource "alicloud_log_project" "default" {
  name        = "${var.name}"
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  project          = "${alicloud_log_project.default.name}"
  name             = "${var.name}"
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_fc_service" "default" {
  name        = "${var.name}"
  description = "tf unit test"
  log_config {
    project  = "${alicloud_log_project.default.name}"
    logstore = "${alicloud_log_store.default.name}"
  }
  role       = "${alicloud_ram_role.default.arn}"
  depends_on = ["alicloud_ram_role_policy_attachment.default"]
}

resource "alicloud_ram_role" "default" {
  name        = "${var.name}"
  document    = <<EOF
		  
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

		  EOF
  description = "this is a test"
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = "${alicloud_ram_role.default.name}"
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

// After serveral hours of investigation, finally figure out how to escape the double quotes.
// https://github.com/hashicorp/terraform/issues/17144
// https://discuss.hashicorp.com/t/how-can-i-escape-double-quotes-in-a-variable-value/4697
locals {
  container_command = "[\"python\", \"server.py\"]"
  container_args    = "[\"a1\", \"a2\"]"
}

output "container_command" {
  value = "${local.container_command}"
}

output "container_args" {
  value = "${local.container_args}"
}

resource "alicloud_fc_function" "default" {
  runtime = var.runtime_var
  custom_container_config {
    command = local.container_command
    image   = "registry.ap-southeast-1.aliyuncs.com/eci_open/nginx:alpine"
    args    = local.container_args
  }

  service = alicloud_fc_service.default.name
  handler = var.handler_var
}
