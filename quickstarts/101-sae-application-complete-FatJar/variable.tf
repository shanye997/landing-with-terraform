variable "name" {
  default = "tfexample85736"
}

variable "auto_enable_application_scaling_rule_var" {
  default = "true"
}

variable "command_var" {
  default = "sleep"
}

variable "cpu_var" {
  default = "1000"
}

variable "package_version_var" {
  default = "1695281662custom_host_alias"
}

variable "batch_wait_time_var" {
  default = "10"
}

variable "envs_var" {
  default = "[{\\\"name\\\":\\\"envtmp\\\",\\\"value\\\":\\\"0\\\"}]"
}

variable "sls_configs_var" {
  default = "[{\\\"logDir\\\":\\\"/root/logs/hsf/hsf.log\\\"}]"
}

variable "timezone_var" {
  default = "Asia/Beijing"
}

variable "package_url_var" {
  default = "http://edas-hz.oss-cn-hangzhou.aliyuncs.com/demo/1.0/hello-sae.jar"
}

variable "replicas_var" {
  default = "5"
}

variable "custom_host_alias_var" {
  default = "[{\\\"hostName\\\":\\\"samplehost\\\",\\\"ip\\\":\\\"127.0.0.1\\\"}]"
}

variable "pre_stop_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "php_config_location_var" {
  default = "/usr/local/etc/php/php.ini"
}

variable "status_var" {
  default = "RUNNING"
}

variable "jdk_var" {
  default = "Open JDK 8"
}

variable "php_config_var" {
  default = "k1=v1"
}

variable "termination_grace_period_seconds_var" {
  default = "30"
}

variable "memory_var" {
  default = "4096"
}

variable "php_arms_config_location_var" {
  default = "/usr/local/etc/php/conf.d/arms.ini"
}

variable "post_start_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "liveness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"5s\\\"]},\\\"initialDelaySeconds\\\":10,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":11}"
}

variable "readiness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"6s\\\"]},\\\"initialDelaySeconds\\\":15,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":12}"
}

variable "min_ready_instances_var" {
  default = "2"
}

variable "command_args_var" {
  default = "[\\\"1d\\\"]"
}

