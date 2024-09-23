provider "alicloud" {
  region = "cn-shanghai"
}

variable "name" {
  default = "terraform-example"
}

resource "random_integer" "default" {
  min = 10000
  max = 99999
}

resource "alicloud_log_project" "default" {
  project_name = "${var.name}-${random_integer.default.result}"
  description  = var.name
}

resource "alicloud_log_store" "default" {
  project_name          = alicloud_log_project.default.name
  logstore_name         = "${var.name}-${random_integer.default.result}"
  shard_count           = 3
  auto_split            = true
  max_split_shard_count = 60
  append_meta           = true
}

resource "time_sleep" "wait_10_minutes" {
  depends_on = [alicloud_log_store.default]

  create_duration = "10m"
}

resource "alicloud_fcv3_function" "function" {
  memory_size   = "512"
  cpu           = 0.5
  handler       = "index.handler"
  function_name = var.name
  runtime       = "python3.10"
  disk_size     = "512"
  code {
    zip_file = "UEsDBBQACAAIAAAAAAAAAAAAAAAAAAAAAAAIAAAAaW5kZXgucHmEkEFKxEAQRfd9ig9ZTCJOooIwDMwNXLqXnnQlaalUhU5lRj2KZ/FOXkESGR114bJ/P/7jV4b1xRq1hijtFpM1682cuNgPmgysbRulPT0fRxXnMtwrSPyeCdYRokSLnuMLJTTkbUqEvDMbxm1VdcRD6Tk+T1LW2ldB66knsYdA5iNX17ebm6tN2VnPhcswMPmREPuBacb+CiapLarAj9gT6/H97dVlCNScY3mtYvRkxdZlwDKDEnanPWVLdrdkeXEGlFEazVdfPVHaVeHc3N15CUwppwOJXeK7HshAB8NuOU7J6sP4SRXuH/EvbUfMiqMmDqv5M5FNSfAj/wgAAP//UEsHCPl//NYAAQAArwEAAFBLAQIUABQACAAIAAAAAAD5f/zWAAEAAK8BAAAIAAAAAAAAAAAAAAAAAAAAAABpbmRleC5weVBLBQYAAAAAAQABADYAAAA2AQAAAAA="
  }
  log_config {
    enable_instance_metrics = true
    enable_request_metrics  = true
    project                 = alicloud_log_project.default.project_name
    logstore                = alicloud_log_store.default.logstore_name
    log_begin_rule          = "None"
  }

  depends_on = [time_sleep.wait_10_minutes]
}

resource "alicloud_fcv3_provision_config" "default" {
  target = "1"
  target_tracking_policies {
    name          = "t1"
    start_time    = "2030-10-10T10:10:10Z"
    end_time      = "2035-10-10T10:10:10Z"
    min_capacity  = "0"
    max_capacity  = "1"
    metric_target = "1"
    metric_type   = "ProvisionedConcurrencyUtilization"
  }
  target_tracking_policies {
    metric_target = "1"
    metric_type   = "ProvisionedConcurrencyUtilization"
    name          = "t2"
    start_time    = "2030-10-10T10:10:10Z"
    end_time      = "2035-10-10T10:10:10Z"
    min_capacity  = "0"
    max_capacity  = "1"
  }
  target_tracking_policies {
    metric_type   = "ProvisionedConcurrencyUtilization"
    time_zone     = "Asia/Shanghai"
    name          = "t3"
    start_time    = "2030-10-10T10:10:10"
    end_time      = "2035-10-10T10:10:10"
    min_capacity  = "0"
    max_capacity  = "1"
    metric_target = "1"
  }

  scheduled_actions {
    target              = "0"
    name                = "s1"
    start_time          = "2030-10-10T10:10:10Z"
    end_time            = "2035-10-10T10:10:10Z"
    schedule_expression = "cron(0 0 4 * * *)"
  }
  scheduled_actions {
    name                = "s2"
    start_time          = "2030-10-10T10:10:10Z"
    end_time            = "2035-10-10T10:10:10Z"
    schedule_expression = "cron(0 0 6 * * *)"
    target              = "1"
  }
  scheduled_actions {
    start_time          = "2030-10-10T10:10:10"
    end_time            = "2035-10-10T10:10:10"
    schedule_expression = "cron(0 0 7 * * *)"
    target              = "0"
    time_zone           = "Asia/Shanghai"
    name                = "s3"
  }

  qualifier           = "LATEST"
  always_allocate_gpu = "true"
  function_name       = alicloud_fcv3_function.function.function_name
  always_allocate_cpu = "true"
}