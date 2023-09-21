variable "name" {
  default = "tf-examplecn-hangzhouehpccluster34574"
}

variable "storage_type" {
  default = "Capacity"
}

variable "cluster_version_var" {
  default = "1.0"
}

variable "ehpc_version_var" {
  default = "1.0.0"
}

variable "system_disk_type_var" {
  default = "cloud_essd"
}

variable "image_owner_alias_var" {
  default = "system"
}

variable "system_disk_size_var" {
  default = "40"
}

variable "remote_vis_enable_var" {
  default = "false"
}

variable "without_elastic_ip_var" {
  default = "false"
}

variable "system_disk_level_var" {
  default = "PL0"
}

variable "is_compute_ess_var" {
  default = "false"
}

variable "volume_mount_option_var" {
  default = "-t nfs -o vers=4.0"
}

variable "without_agent_var" {
  default = "false"
}

