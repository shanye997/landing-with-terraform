variable "name" {
  default = "tf-examplecmshybridmonitorfctask17478"
}

variable "yarm_config_var" {
  default = "---\\nproducts:\\n- namespace: \\\"acs_ecs_dashboard1\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"CPUUtilization\\\"\\n    - \\\"DiskReadBPS\\\"\\n    - \\\"InternetOut\\\"\\n    - \\\"IntranetOut\\\"\\n    - \\\"cpu_idle\\\"\\n    - \\\"cpu_system\\\"\\n    - \\\"cpu_total\\\"\\n    - \\\"diskusage_utilization\\\"\\n- namespace: \\\"acs_rds_dashboard\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"MySQL_QPS\\\"\\n    - \\\"MySQL_TPS\\\"\\n- namespace: \\\"acs_ecs_dashboard\\\"\\n  metric_info:\\n  - metric_list:\\n    - \\\"cpu_total\\\"\\n    - \\\"diskusage_utilization\\\"\\n    - \\\"memory_usedutilization\\\"\\n    - \\\"net_tcpconnection\\\"\\n"
}

