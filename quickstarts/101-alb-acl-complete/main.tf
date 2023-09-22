data "alicloud_resource_manager_resource_groups" "default" {}

resource "alicloud_alb_acl" "default" {
  acl_name          = var.name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  tags = {
    Created = "tfexample99"
    For     = "Tfexample99"
  }
  dry_run = var.dry_run_var
}
