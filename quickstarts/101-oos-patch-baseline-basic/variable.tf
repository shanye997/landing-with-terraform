variable "name" {
  default = "tf-examplecn-hangzhouoospatchbaseline31576"
}

variable "approval_rules_var" {
  default = "{\\\"PatchRules\\\":[{\\\"PatchFilterGroup\\\":[{\\\"Key\\\":\\\"PatchSet\\\",\\\"Values\\\":[\\\"OS\\\"]},{\\\"Key\\\":\\\"ProductFamily\\\",\\\"Values\\\":[\\\"Windows\\\"]},{\\\"Key\\\":\\\"Product\\\",\\\"Values\\\":[\\\"Windows 10\\\",\\\"Windows 7\\\"]},{\\\"Key\\\":\\\"Classification\\\",\\\"Values\\\":[\\\"Security Updates\\\",\\\"Updates\\\",\\\"Update Rollups\\\",\\\"Critical Updates\\\"]},{\\\"Key\\\":\\\"Severity\\\",\\\"Values\\\":[\\\"Critical\\\",\\\"Important\\\",\\\"Moderate\\\"]}],\\\"ApproveAfterDays\\\":7,\\\"EnableNonSecurity\\\":true,\\\"ComplianceLevel\\\":\\\"Medium\\\"}]}"
}

