variable "description_var" {
  default = "tf unit test "
}

variable "policy_var" {
  default = "{\\\"Version\\\":\\\"1\\\",\\\"Statement\\\":[{\\\"Resource\\\":\\\"acs:log:*:*:project/exampleproject/*\\\",\\\"Effect\\\":\\\"Deny\\\",\\\"Action\\\":[\\\"log:PostLogStoreLogs\\\"],\\\"Condition\\\":{\\\"StringNotLike\\\":{\\\"acs:SourceVpc\\\":[\\\"vpc-*\\\"]}}}]}"
}

