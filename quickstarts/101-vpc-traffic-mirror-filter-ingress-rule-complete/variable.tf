variable "name" {
  default = "tf-example-vpctrafficmirrorfilteringressrule23989"
}

variable "dry_run_var" {
  default = "false"
}

variable "rule_action_var" {
  default = "accept"
}

variable "source_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "source_port_range_var" {
  default = "1/120"
}

variable "destination_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "destination_port_range_var" {
  default = "1/120"
}

variable "priority_var" {
  default = "1"
}

variable "protocol_var" {
  default = "ICMP"
}

