variable "name" {
  default = "terraform-example"
}

variable "oidc_provider_name" {
  default = "amp-resource-example-oidc-provider"
}


resource "alicloud_ims_oidc_provider" "default" {
  description         = var.oidc_provider_name
  issuer_url          = "https://oauth.aliyun.com"
  fingerprints        = ["902ef2deeb3c5b13ea4c3d5193629309e231ae55"]
  issuance_limit_time = "12"
  oidc_provider_name  = var.name
  client_ids          = ["123", "456"]
}