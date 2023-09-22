variable "name" {
  default = "tf-examplecn-hangzhouCmsGroupMetricRuletf-example-rule-name31513"
}

variable "metric_name_var" {
  default = "cpu_total"
}

variable "silence_time_var" {
  default = "86400"
}

variable "email_subject_var" {
  default = "tf-example-rule-name-warning"
}

variable "webhook_var" {
  default = "http://www.aliyun.com"
}

variable "period_var" {
  default = "60"
}

variable "no_effective_interval_var" {
  default = "00:00-05:30"
}

variable "effective_interval_var" {
  default = "00:00-23:59"
}

