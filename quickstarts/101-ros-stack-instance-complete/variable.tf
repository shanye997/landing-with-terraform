variable "name" {
  default = "tf-examplecn-hangzhourosstackinstance35143"
}

variable "account_id" {
  default = ""
}

variable "timeout_in_minutes_var" {
  default = "60"
}

variable "operation_description_var" {
  default = "tf-acctest"
}

variable "operation_preferences_var" {
  default = "{\\\"FailureToleranceCount\\\": 1,\\\"MaxConcurrentCount\\\": 2}"
}

variable "retain_stacks_var" {
  default = "true"
}

