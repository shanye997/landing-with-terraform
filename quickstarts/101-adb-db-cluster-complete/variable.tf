variable "name" {
  default = "tf-examplecn-hangzhouadbCluster16550"
}

variable "compute_resource_var" {
  default = "32Core128GB"
}

variable "period_var" {
  default = "1"
}

variable "mode_var" {
  default = "flexible"
}

variable "db_node_class_var" {
  default = "C8"
}

variable "db_cluster_category_var" {
  default = "MixedStorage"
}

variable "db_node_storage_var" {
  default = "100"
}

variable "payment_type_var" {
  default = "PayAsYouGo"
}

variable "elastic_io_resource_var" {
  default = "1"
}

variable "db_node_count_var" {
  default = "1"
}

variable "maintain_time_var" {
  default = "01:00Z-02:00Z"
}

