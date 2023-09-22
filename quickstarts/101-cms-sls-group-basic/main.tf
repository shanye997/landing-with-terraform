data "alicloud_account" "this" {}

resource "alicloud_cms_sls_group" "default" {
  sls_group_config {
    sls_logstore = "Logstore-ECS"
    sls_project  = "aliyun-project"
    sls_region   = "cn-hangzhou"
    sls_user_id  = data.alicloud_account.this.id
  }

  sls_group_name = var.name
}
