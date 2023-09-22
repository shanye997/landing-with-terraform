variable "name" {
  default = "tfexample4918"
}

variable "php_config_var" {
  default = "k1=v1"
}

variable "php_config_location_var" {
  default = "/usr/local/etc/php/php.ini"
}

variable "replicas_var" {
  default = "6"
}

variable "cpu_var" {
  default = "1000"
}

variable "post_start_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "auto_enable_application_scaling_rule_var" {
  default = "true"
}

variable "custom_host_alias_var" {
  default = "[{\\\"hostName\\\":\\\"samplehost\\\",\\\"ip\\\":\\\"127.0.0.1\\\"}]"
}

variable "termination_grace_period_seconds_var" {
  default = "30"
}

variable "command_var" {
  default = "sleep"
}

variable "image_url_var" {
  default = "registry-vpc.cn-hangzhou.aliyuncs.com/lxepoo/apache-php5"
}

variable "php_arms_config_location_var" {
  default = "/usr/local/etc/php/conf.d/arms.ini"
}

variable "micro_registration_var" {
  default = "1"
}

variable "package_version_var" {
  default = "1695281662"
}

variable "memory_var" {
  default = "4096"
}

variable "batch_wait_time_var" {
  default = "10"
}

variable "envs_var" {
  default = "[{\\\"name\\\":\\\"envtmp\\\",\\\"value\\\":\\\"0\\\"}]"
}

variable "liveness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"5s\\\"]},\\\"initialDelaySeconds\\\":10,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":11}"
}

variable "command_args_var" {
  default = "[\\\"1d\\\"]"
}

variable "min_ready_instances_var" {
  default = "2"
}

variable "sls_configs_var" {
  default = "[{\\\"logDir\\\":\\\"/root/logs/hsf/hsf.log\\\"}]"
}

variable "edas_container_version_var" {
  default = "3.5.3"
}

variable "pre_stop_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "status_var" {
  default = "RUNNING"
}

variable "readiness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"6s\\\"]},\\\"initialDelaySeconds\\\":15,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":12}"
}

variable "timezone_var" {
  default = "Asia/Beijing"
}

