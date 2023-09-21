variable "name" {
  default = "tf-examplecn-hangzhouarmsprometheusmonitoring25731"
}

variable "config_yaml_var" {
  default = "apiVersion: monitoring.coreos.com/v1\\nkind: ServiceMonitor\\nmetadata:\\n  name: tomcat-demo\\n  namespace: default\\nspec:\\n  endpoints:\\n  - bearerTokenSecret:\\n      key: ''\\n    interval: 30s\\n    path: /metrics\\n    port: tomcat-monitor\\n  namespaceSelector:\\n    any: true\\n  selector:\\n    matchLabels:\\n      app: tomcat"
}

