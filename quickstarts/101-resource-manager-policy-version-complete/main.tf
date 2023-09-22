resource "alicloud_resource_manager_policy" "example" {
  policy_name     = "tf-exampleResourceManagerPolicyVersion-2269717"
  policy_document = <<EOF
			{
				"Statement": [{
					"Action": ["oss:*"],
					"Effect": "Allow",
					"Resource": ["acs:oss:*:*:*"]
				}],
				"Version": "1"
			}
	    EOF
}

resource "alicloud_resource_manager_policy_version" "example" {
  policy_document = "{\n\"Statement\": [{\n\"Action\": [\"oss:*\"],\n\"Effect\": \"Allow\",\n\"Resource\": [\"acs:oss:*:*:*\"]\n}],\n\"Version\": \"1\"\n}"
  policy_name     = alicloud_resource_manager_policy.example.policy_name
}
