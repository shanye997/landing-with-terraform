resource "alicloud_hbr_vault" "default" {
  vault_name = var.name
}

data "alicloud_resource_manager_resource_groups" "default" {
  status = "OK"
}

data "alicloud_instances" "default" {
  status = "Running"
}

resource "alicloud_hbr_hana_instance" "default" {
  password             = "YouPassword123"
  resource_group_id    = data.alicloud_resource_manager_resource_groups.default.groups.0.id
  host                 = var.host_var
  sid                  = "HXE"
  use_ssl              = var.use_ssl_var
  vault_id             = alicloud_hbr_vault.default.id
  user_name            = var.user_name_var
  hana_name            = var.name
  instance_number      = var.instance_number_var
  validate_certificate = var.validate_certificate_var
  alert_setting        = var.alert_setting_var
  ecs_instance_ids = [
    data.alicloud_instances.default.ids.0
  ]
}
