data "alicloud_account" "this" {}

resource "alicloud_cms_sls_group" "default" {
  sls_group_config {
    sls_user_id  = data.alicloud_account.this.id
    sls_logstore = "Logstore-ECS"
    sls_project  = "aliyun-project"
    sls_region   = "cn-hangzhou"
  }
  sls_group_description = var.name
  sls_group_name        = var.name
}

resource "alicloud_cms_namespace" "default" {
  description   = var.name
  namespace     = "tf-example-cloudmonitorservicenamespace"
  specification = "cms.s1.large"
}

resource "alicloud_cms_hybrid_monitor_sls_task" "default" {
  description = var.name
  namespace   = alicloud_cms_namespace.default.id
  sls_process_config {
    express {
      alias   = "SuccRate"
      express = "success_count"
    }

    filter {
      relation = "and"
      filters {
        value        = "200"
        operator     = "="
        sls_key_name = "code"
      }

    }

    group_by {
      alias        = "code"
      sls_key_name = "ApiResult"
    }

    statistics {
      sls_key_name  = "name"
      alias         = "level_count"
      function      = "count"
      parameter_one = "100"
      parameter_two = "199"
    }

  }

  task_name = var.name
  attach_labels {
    name  = "app_service1"
    value = "testValue1"
  }

  collect_interval    = var.collect_interval_var
  collect_target_type = alicloud_cms_sls_group.default.id
}
