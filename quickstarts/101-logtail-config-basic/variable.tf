variable "name" {
  default = "tf-examplelogtailconfig-1696563"
}

variable "input_detail_var" {
  default = "{\\\"plugin\\\":{\\\"inputs\\\":[{\\\"detail\\\":{\\\"ExcludeEnv\\\":null,\\\"ExcludeLabel\\\":null,\\\"IncludeEnv\\\":null,\\\"IncludeLabel\\\":null,\\\"Stderr\\\":true,\\\"Stdout\\\":true},\\\"type\\\":\\\"service_docker_stdout\\\"}]}}"
}

variable "input_type_var" {
  default = "plugin"
}

variable "output_type_var" {
  default = "LogService"
}

