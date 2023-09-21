data "alicloud_account" "default" {}

resource "alicloud_resource_manager_role" "default" {
  assume_role_policy_document = var.assume_role_policy_document_var
  description                 = "Test resourceManager role"
  max_session_duration        = var.max_session_duration_var
  role_name                   = "tf-exampleResourceManagerRole4199264"
}
