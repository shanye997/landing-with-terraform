variable "content_var" {
  default = "FormatVersion: OOS-2019-06-01\\nDescription: Describe instances of given status\\nParameters:\\n  Status:\\n    Type: String\\n    Description: (Required) The status of the Ecs instance.\\nTasks:\\n  - Properties:\\n      Parameters:\\n        Status: '{{ Status }}'\\n      API: DescribeInstances\\n      Service: Ecs\\n    Name: foo\\n    Action: 'ACS::ExecuteApi'"
}

variable "version_name_var" {
  default = "test3"
}

