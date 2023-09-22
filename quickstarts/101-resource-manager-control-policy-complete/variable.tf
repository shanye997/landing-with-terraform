variable "name" {
  default = "tf-examplecn-hangzhouresourcemanagercontrolpolicy16155"
}

variable "description_var" {
  default = "tf-examplecn-hangzhouresourcemanagercontrolpolicy16155"
}

variable "policy_document_var" {
  default = "{\\\"Version\\\":\\\"1\\\",\\\"Statement\\\":[{\\\"Effect\\\":\\\"Deny\\\",\\\"Action\\\":[\\\"ram:UpdateRole\\\",\\\"ram:DeleteRole\\\",\\\"ram:AttachPolicyToRole\\\",\\\"ram:DetachPolicyFromRole\\\"],\\\"Resource\\\":\\\"acs:ram:*:*:role/ResourceDirectoryAccountAccessRole\\\"}]}"
}

