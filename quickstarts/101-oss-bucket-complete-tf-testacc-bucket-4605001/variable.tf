variable "policy_var" {
  default = "{\\\"Statement\\\":[{\\\"Action\\\":[\\\"oss:*\\\"],\\\"Effect\\\":\\\"Allow\\\",\\\"Resource\\\":[\\\"acs:oss:*:*:*\\\"]}],\\\"Version\\\":\\\"1\\\"}"
}

variable "acl_var" {
  default = "public-read-write"
}

