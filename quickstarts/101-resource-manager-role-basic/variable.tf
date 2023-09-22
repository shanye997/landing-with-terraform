variable "assume_role_policy_document_var" {
  default = "{\\n    \\\"Statement\\\": [{\\n            \\\"Action\\\": \\\"sts:AssumeRole\\\",\\n            \\\"Effect\\\": \\\"Allow\\\",\\n            \\\"Principal\\\": {\\\"RAM\\\": [\\\"acs:ram::$${data.alicloud_account.default.id}:root\\\"]}}],\\n    \\\"Version\\\": \\\"1\\\"}"
}

