resource "alicloud_resource_manager_policy" "default" {
  policy_document = "{\n\"Statement\": [{\n\"Action\": [\"oss:*\"],\n\"Effect\": \"Allow\",\n\"Resource\": [\"acs:oss:*:*:*\"]\n}],\n\"Version\": \"1\"\n}"
  policy_name     = "tf-exampleResourceManagerPolicy-2206879"
}
