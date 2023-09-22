resource "alicloud_maxcompute_project" "default" {
  ip_white_list {
    ip_list     = "1.1.1.1,2.2.2.2"
    vpc_ip_list = "10.10.10.10,11.11.11.11"
  }

  product_type = var.product_type_var
  project_name = "${var.name}_u"
  properties {
    table_lifecycle {
      value = "37231"
      type  = "optional"
    }

    timezone        = "Asia/Shanghai"
    type_system     = "2"
    allow_full_scan = "false"
    enable_decimal2 = "true"
    encryption {
      algorithm = "AESCTR"
      enable    = "true"
      key       = "f58d854d-7bc0-4a6e-9205-160e10ffedec"
    }

    retention_days   = "1"
    sql_metering_max = "0"
  }

  security_properties {
    enable_download_privilege            = "false"
    label_security                       = "true"
    object_creator_has_access_permission = "true"
    object_creator_has_grant_permission  = "true"
    project_protection {
      protected = "false"
    }

  }

  comment       = "${var.name}_u"
  default_quota = var.default_quota_var
}
