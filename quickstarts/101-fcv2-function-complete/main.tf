locals {
  container_command = "[\"python\", \"server.py\"]"
  container_args    = "[\"a1\", \"a2\"]"
}

output "container_command" {
  value = local.container_command
}

output "container_args" {
  value = local.container_args
}

resource "alicloud_log_project" "default" {
  name        = var.name
  description = "tf unit test"
}

resource "alicloud_log_store" "default" {
  project          = alicloud_log_project.default.name
  name             = var.name
  retention_period = "3000"
  shard_count      = 1
}

resource "alicloud_fc_service" "default" {
  name        = var.name
  description = "tf unit test"
  log_config {
    project  = alicloud_log_project.default.name
    logstore = alicloud_log_store.default.name
  }
  role       = alicloud_ram_role.default.arn
  depends_on = ["alicloud_ram_role_policy_attachment.default"]
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
  role_name   = alicloud_ram_role.default.name
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_fcv2_function" "default" {
  instance_concurrency = var.instance_concurrency_var
  disk_size            = var.disk_size_var
  runtime              = var.runtime_var
  cpu                  = var.cpu_var
  code_checksum        = var.code_checksum_var
  custom_dns {
    dns_options {
      value = "1"
      name  = "tf-examplecn-hangzhoufcv2function27467"
    }
    dns_options {
      name  = "tf-examplecn-hangzhoufcv2function27467"
      value = "2"
    }
    dns_options {
      name  = "tf-examplecn-hangzhoufcv2function27467"
      value = "3"
    }

    name_servers = [
      "223.5.5.5",
      "221.10.10.10",
      "210.22.22.10"
    ]
    searches = [
      "mydomain.com",
      "mydomain1.com",
      "mydomain2.com"
    ]
  }

  custom_runtime_config {
    command = [
      "command1",
      "command2",
      "command3"
    ]
    args = [
      "arg1",
      "arg2",
      "arg3"
    ]
  }

  memory_size            = var.memory_size_var
  function_name          = "tf-examplecn-hangzhoufcv2function21340"
  initialization_timeout = var.initialization_timeout_var
  handler                = var.handler_var
  ca_port                = var.ca_port_var
  timeout                = var.timeout_var
  instance_lifecycle_config {
    pre_freeze {
      handler = "index.prefreeze"
      timeout = "30"
    }

    pre_stop {
      handler = "index.prestop"
      timeout = "30"
    }

  }

  service_name = alicloud_fc_service.default.name
  custom_container_config {
    web_server_mode   = "true"
    acceleration_type = "Default"
    args              = "[\"--debug\"]"
    command           = "[\"python\",\"app.py\"]"
    image             = "registry-vpc.cn-hangzhou.aliyuncs.com/fc-stable-diffusion/stable-diffusion:v1"
  }

  instance_type = var.instance_type_var
  layers = [
    "acs:fc:cn-hangzhou:official:layers/Python310/versions/2",
    "acs:fc:cn-hangzhou:official:layers/Nodejs18/versions/1",
    "acs:fc:cn-hangzhou:official:layers/ServerlessDevs/versions/1"
  ]
  code {
    zip_file = "UEsDBAoAAAAAAEZU5FYAAAAAAAAAAAAAAAAFABwAY29kZS9VVAkAAySFo2Q8haNkdXgLAAEE9gEAAAQUAAAAUEsDBBQAAAAIAEZU5FaBE2T3pAEAANQCAAANABwAY29kZS9pbmRleC5weVVUCQADJIWjZCWFo2R1eAsAAQT2AQAABBQAAABlUsFq20AQvesrpuSwUrElN1AwhpySgqEGl2DowTViLY2sJasddXcUJ/2UfEv+qb/QkS0b0expd96b92YeewPTz1MoqDTusICOq+m8r0SRaVryDJYOB4Gi5bfVap3/XD+uHuAO9mqJ1hIcydvy0y+nougGNgTo9N4icI1gnGGjrfmDHirU3HmEuGZuwyLLarRtKuBr59KCmqykomvQcV4ia2OzL1/nt7N5WnNjE1FuLeogko1cetpHg84VbMiBDrBHS8e/72/SV2I1psUFOcYXThaCyel3k+a7y5LpAXl1qsXJmJEaV1GsrkpCVUkURb18rV1ppQHds/HkJhBYe849hpZcQLHqdQZjsRp4W1UV6VBVuxPH4+8OA+edN//xRsjArcjD0wSeZbsLMzWMTYgHQwBTwVN6GiYcDdexWm42P3J1xQEkV08FhgBFF5iaywRQoy7Rhyux1eH8kEQJAjXItWQgPI+nuthwF2RqdTubwfq7GhY6Z5APeoJvY3XfL+14yq8tqgmoPoGstdo4lewuaqME47P45INcMpjIz3KwHf3P3T9QSwECHgMKAAAAAABGVORWAAAAAAAAAAAAAAAABQAYAAAAAAAAABAA7UEAAAAAY29kZS9VVAUAAySFo2R1eAsAAQT2AQAABBQAAABQSwECHgMUAAAACABGVORWgRNk96QBAADUAgAADQAYAAAAAAABAAAApIE/AAAAY29kZS9pbmRleC5weVVUBQADJIWjZHV4CwABBPYBAAAEFAAAAFBLBQYAAAAAAgACAJ4AAAAqAgAAAAA="
  }

  custom_health_check_config {
    success_threshold     = "1"
    timeout_seconds       = "3"
    failure_threshold     = "1"
    http_get_url          = "/healthcheck"
    initial_delay_seconds = "3"
    period_seconds        = "3"
  }

  gpu_memory_size = var.gpu_memory_size_var
  description     = var.description_var
  initializer     = var.initializer_var
  environment_variables = {

  }
}
