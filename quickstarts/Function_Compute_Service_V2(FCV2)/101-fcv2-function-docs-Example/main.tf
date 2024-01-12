variable "name" {
  default = "terraform-example"
}

resource "alicloud_log_project" "default" {
  name        = var.name
  description = var.name
}

resource "alicloud_log_store" "default" {
  project          = alicloud_log_project.default.name
  name             = var.name
  retention_period = "3000"
  shard_count      = 1
}

# add index for logstore, which is used to query logs
locals {
  sls_default_token = ", '\";=()[]{}?@&<>/:\n\t\r"
}

resource "alicloud_log_store_index" "example" {
  project  = alicloud_log_project.default.name
  logstore = alicloud_log_store.default.name
  full_text {
    case_sensitive = false
    token          = local.sls_default_token
  }
  field_search {
    name             = "aggPeriodSeconds"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "concurrentRequests"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "cpuPercent"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "cpuQuotaPercent"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "functionName"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
    case_sensitive   = true
  }
  field_search {
    name             = "hostname"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "instanceID"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "ipAddress"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "memoryLimitMB"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "memoryUsageMB"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "memoryUsagePercent"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "operation"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "qualifier"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
    case_sensitive   = true
  }
  field_search {
    name             = "rxBytes"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "rxTotalBytes"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "serviceName"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
    case_sensitive   = true
  }
  field_search {
    name             = "txBytes"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "txTotalBytes"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
  field_search {
    name             = "versionId"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "events"
    enable_analytics = true
    type             = "json"
    token            = local.sls_default_token
  }
  field_search {
    name             = "isColdStart"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "hasFunctionError"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "errorType"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "triggerType"
    enable_analytics = true
    type             = "text"
    token            = local.sls_default_token
  }
  field_search {
    name             = "durationMs"
    enable_analytics = true
    type             = "double"
    token            = local.sls_default_token
  }
  field_search {
    name             = "statusCode"
    enable_analytics = true
    type             = "long"
    token            = local.sls_default_token
  }
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
  description = var.name
  force       = true
}

resource "alicloud_ram_role_policy_attachment" "default" {
  role_name   = alicloud_ram_role.default.name
  policy_name = "AliyunLogFullAccess"
  policy_type = "System"
}

resource "alicloud_fc_service" "default" {
  name        = var.name
  description = var.name
  log_config {
    project  = alicloud_log_project.default.name
    logstore = alicloud_log_store.default.name
  }
  role = alicloud_ram_role.default.arn
}

resource "alicloud_fcv2_function" "default" {
  function_name          = var.name
  memory_size            = 1024
  runtime                = "custom.debian10"
  description            = var.name
  service_name           = alicloud_fc_service.default.name
  initializer            = "index.initializer"
  initialization_timeout = 10
  timeout                = 60
  handler                = "index.handler"
  instance_type          = "e1"
  instance_lifecycle_config {
    pre_freeze {
      handler = "index.prefreeze"
      timeout = 30
    }
    pre_stop {
      handler = "index.prestop"
      timeout = 30
    }
  }
  code {
    oss_bucket_name = "code-sample-cn-hangzhou"
    oss_object_name = "quick-start-sample-codes/quick-start-sample-codes-nodejs/RocketMQ-producer-nodejs14-event/code.zip"
  }
  custom_dns {
    name_servers = ["223.5.5.5"]
    searches     = ["mydomain.com"]
    dns_options {
      name  = var.name
      value = "1"
    }
  }
  disk_size            = 512
  instance_concurrency = 10
  layers               = ["d3fc5de8d120687be2bfab761518d5de#Nodejs-Aliyun-SDK#2", "d3fc5de8d120687be2bfab761518d5de#Python39#2"]
  cpu                  = 1
  custom_health_check_config {
    http_get_url          = "/healthcheck"
    initial_delay_seconds = 3
    period_seconds        = 3
    timeout_seconds       = 3
    failure_threshold     = 1
    success_threshold     = 1
  }
  ca_port = 9000
  custom_runtime_config {
    command = ["npm"]
    args    = ["run", "start"]
  }
}