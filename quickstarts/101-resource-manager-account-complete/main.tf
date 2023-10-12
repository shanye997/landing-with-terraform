resource "alicloud_resource_manager_folder" "default" {
  folder_name = var.name
}

resource "alicloud_resource_manager_account" "default" {
  display_name = var.display_name_var
  folder_id    = alicloud_resource_manager_folder.default.id
  tags = {
    Created = "TF_Update"
    For     = "ACCOUNT_Update"
  }
}
