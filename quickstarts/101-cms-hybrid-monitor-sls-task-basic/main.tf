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
  sls_process_config {
    statistics {
      parameter_two = "199"
      sls_key_name  = "name"
      alias         = "level_count"
      function      = "count"
      parameter_one = "100"
    }

    express {
      alias   = "SuccRate"
      express = "success_count"
    }

    filter {
      filters {
        operator     = "="
        sls_key_name = "code"
        value        = "200"
      }

      relation = "and"
    }

    group_by {
      alias        = "code"
      sls_key_name = "ApiResult"
    }

  }

  namespace           = alicloud_cms_namespace.default.id
  collect_target_type = alicloud_cms_sls_group.default.id
  task_name           = var.name
}
