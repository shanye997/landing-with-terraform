variable "name" {
  default = "tf-example-vpctrafficmirrorfilteringressrule23989"
}

variable "destination_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "source_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "protocol_var" {
  default = "ICMP"
}

variable "priority_var" {
  default = "1"
}

variable "rule_action_var" {
  default = "accept"
}

