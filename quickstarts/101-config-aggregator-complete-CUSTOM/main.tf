data "alicloud_resource_manager_accounts" "default" {
  status = "CreateSuccess"
}

resource "alicloud_config_aggregator" "default" {
  description = var.description_var
  aggregator_accounts {
    account_name = data.alicloud_resource_manager_accounts.default.accounts.0.display_name
    account_type = "ResourceDirectory"
    account_id   = data.alicloud_resource_manager_accounts.default.accounts.0.account_id
  }

  aggregator_name = var.name
  aggregator_type = "CUSTOM"
}
