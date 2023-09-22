variable "name" {
  default = "tf-exampleautoprovisioninggroup-126378"
}

variable "terminate_instances_with_expiration_var" {
  default = "false"
}

variable "auto_provisioning_group_name_var" {
  default = "auto_provisioning_group"
}

variable "pay_as_you_go_target_capacity_var" {
  default = "1"
}

variable "default_target_capacity_type_var" {
  default = "Spot"
}

variable "excess_capacity_termination_policy_var" {
  default = "no-termination"
}

variable "spot_target_capacity_var" {
  default = "2"
}

variable "total_target_capacity_var" {
  default = "4"
}

variable "max_spot_price_var" {
  default = "2"
}

