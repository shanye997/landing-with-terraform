variable "name" {
  default = "tf-example-vpctrafficmirrorfilteregressrule31941"
}

variable "source_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "destination_cidr_block_var" {
  default = "10.0.0.0/24"
}

variable "priority_var" {
  default = "1"
}

variable "rule_action_var" {
  default = "accept"
}

variable "protocol_var" {
  default = "ICMP"
}

