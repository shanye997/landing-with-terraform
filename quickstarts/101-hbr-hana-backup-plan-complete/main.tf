resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

resource "alicloud_hbr_hana_instance" "default" {
  alert_setting        = "INHERITED"
  hana_name            = var.name
  host                 = "1.1.1.1"
  instance_number      = "1"
  password             = "YouPassword123"
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  sid                  = "HXE"
  use_ssl              = "false"
  user_name            = "admin"
  validate_certificate = "false"
  vault_id             = alicloud_hbr_vault.default.id
}

resource "alicloud_hbr_hana_backup_plan" "default" {
  cluster_id        = alicloud_hbr_hana_instance.default.hana_instance_id
  plan_name         = var.name
  resource_group_id = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  database_name     = "SYSTEMDB"
  schedule          = var.schedule_var
  status            = var.status_var
  vault_id          = alicloud_hbr_vault.default.id
  backup_prefix     = var.backup_prefix_var
  backup_type       = "COMPLETE"
}
