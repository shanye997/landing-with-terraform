resource "alicloud_resource_manager_folder" "example" {
  folder_name = "tf-example870912"
}

resource "alicloud_resource_manager_control_policy" "example" {
  control_policy_name = var.name
  description         = var.name
  effect_scope        = "RAM"
  policy_document     = "{\"Version\":\"1\",\"Statement\":[{\"Effect\":\"Deny\",\"Action\":[\"ram:UpdateRole\",\"ram:DeleteRole\",\"ram:AttachPolicyToRole\",\"ram:DetachPolicyFromRole\"],\"Resource\":\"acs:ram:*:*:role/ResourceDirectoryAccountAccessRole\"}]}"
}

resource "alicloud_resource_manager_control_policy_attachment" "default" {
  target_id = alicloud_resource_manager_folder.example.id
  policy_id = alicloud_resource_manager_control_policy.example.id
}
