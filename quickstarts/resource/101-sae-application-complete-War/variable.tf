variable "name" {
  default = "tfexample37596"
}

variable "envs_var" {
  default = "[{\\\"name\\\":\\\"envtmp\\\",\\\"value\\\":\\\"0\\\"}]"
}

variable "cpu_var" {
  default = "1000"
}

variable "sls_configs_var" {
  default = "[{\\\"logDir\\\":\\\"/root/logs/hsf/hsf.log\\\"}]"
}

variable "batch_wait_time_var" {
  default = "10"
}

variable "package_url_var" {
  default = "http://edas-hz.oss-cn-hangzhou.aliyuncs.com/demo/1.0/hello-sae.war?spm=5176.12834076.0.0.60326a68Uw5yB4&file=hello-sae.war"
}

variable "termination_grace_period_seconds_var" {
  default = "30"
}

variable "php_arms_config_location_var" {
  default = "/usr/local/etc/php/conf.d/arms.ini"
}

variable "jdk_var" {
  default = "Open JDK 8"
}

variable "readiness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"6s\\\"]},\\\"initialDelaySeconds\\\":15,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":12}"
}

variable "min_ready_instances_var" {
  default = "2"
}

variable "memory_var" {
  default = "4096"
}

variable "command_args_var" {
  default = "[\\\"1d\\\"]"
}

variable "timezone_var" {
  default = "Asia/Beijing"
}

variable "status_var" {
  default = "RUNNING"
}

variable "command_var" {
  default = "sleep"
}

variable "post_start_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "pre_stop_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"cat\\\",\\\"/etc/group\\\"]}}"
}

variable "web_container_var" {
  default = "apache-tomcat-8.5.42"
}

variable "replicas_var" {
  default = "5"
}

variable "liveness_var" {
  default = "{\\\"exec\\\":{\\\"command\\\":[\\\"sleep\\\",\\\"5s\\\"]},\\\"initialDelaySeconds\\\":10,\\\"periodSeconds\\\":30,\\\"timeoutSeconds\\\":11}"
}

variable "package_version_var" {
  default = "1695281662custom_host_alias"
}

variable "custom_host_alias_var" {
  default = "[{\\\"hostName\\\":\\\"samplehost\\\",\\\"ip\\\":\\\"127.0.0.1\\\"}]"
}

variable "auto_enable_application_scaling_rule_var" {
  default = "true"
}

variable "php_config_var" {
  default = "k1=v1"
}

variable "php_config_location_var" {
  default = "/usr/local/etc/php/php.ini"
}

