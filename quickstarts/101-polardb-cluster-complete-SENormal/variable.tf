variable "name" {
  default = "tf-examplePolarDBClusterMult"
}

variable "proxy_type_var" {
  default = "EXCLUSIVE"
}

variable "storage_space_var" {
  default = "30"
}

variable "db_node_num_var" {
  default = "2"
}

variable "pay_type_var" {
  default = "PostPaid"
}

variable "db_node_class_var" {
  default = "polar.mysql.x2.large.c"
}

variable "hot_standby_cluster_var" {
  default = "ON"
}

variable "proxy_class_var" {
  default = "polar.maxscale.g2.medium.c"
}

