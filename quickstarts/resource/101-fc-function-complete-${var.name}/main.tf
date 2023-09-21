provider "alicloud" {
  assume_role {}
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

resource "alicloud_oss_bucket" "default" {
  bucket = "${var.name}"
}

resource "alicloud_oss_bucket_object" "default" {
  bucket = "${alicloud_oss_bucket.default.id}"
  key    = "fc/hello.zip"
  source = "/var/folders/2g/75_g3cg150q53lpr1h28sg5m0000gp/T/tf-examplecn-hangzhoualicloudfcfunction-1952.zip"
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

resource "alicloud_fc_function" "default" {
  instance_concurrency   = var.instance_concurrency_var
  initialization_timeout = var.initialization_timeout_var
  timeout                = var.timeout_var
  initializer            = var.initializer_var
  name                   = var.name
  oss_key                = alicloud_oss_bucket_object.default.key
  environment_variables = {

  }
  runtime       = var.runtime_var
  instance_type = var.instance_type_var
  description   = var.description_var
  handler       = var.handler_var
  memory_size   = var.memory_size_var
  service       = alicloud_fc_service.default.name
  oss_bucket    = alicloud_oss_bucket.default.id
}
