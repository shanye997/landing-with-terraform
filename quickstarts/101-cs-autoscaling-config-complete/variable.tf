variable "name" {
  default = "tf-exampleCSAutoscalingConfig-1229204"
}

variable "cool_down_duration_var" {
  default = "10m"
}

variable "gpu_utilization_threshold_var" {
  default = "0.5"
}

variable "unneeded_duration_var" {
  default = "10m"
}

variable "scale_up_from_zero_var" {
  default = "true"
}

variable "skip_nodes_with_system_pods_var" {
  default = "true"
}

variable "expander_var" {
  default = "least-waste"
}

variable "max_graceful_termination_sec_var" {
  default = "14400"
}

variable "scale_down_enabled_var" {
  default = "true"
}

variable "recycle_node_deletion_enabled_var" {
  default = "false"
}

variable "skip_nodes_with_local_storage_var" {
  default = "false"
}

variable "daemonset_eviction_for_nodes_var" {
  default = "false"
}

variable "min_replica_count_var" {
  default = "0"
}

variable "utilization_threshold_var" {
  default = "0.5"
}

variable "scan_interval_var" {
  default = "30s"
}

