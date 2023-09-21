variable "name" {
  default = "tf-exampleedgek8s-1887632"
}

variable "disks" {
  type = list(object({
    size     = string
    category = string
  }))
  default = [
    {
      "size"     = "200",
      "category" = "cloud_efficiency",
    }
  ]

}

