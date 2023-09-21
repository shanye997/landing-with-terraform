variable "name" {
  default = "tf-examplecn-hangzhoucdnfctrigger52705"
}

variable "role_arn_var" {
  default = "acs:ram::$${data.alicloud_account.default.id}:role/aliyuncdneventnotificationrole"
}

variable "source_arn_var" {
  default = "acs:cdn:*:$${data.alicloud_account.default.id}:domain/example1.com"
}

