resource "alicloud_ims_oidc_provider" "default" {
  fingerprints = [
    "902ef2deeb3c5b13ea4c3d5193629309e231ae55"
  ]
  issuance_limit_time = var.issuance_limit_time_var
  issuer_url          = "https://oauth.aliyun.com"
  oidc_provider_name  = "tf-examplecn-hangzhouimsoidcprovider61937"
  client_ids = [
    "123",
    "456"
  ]
  description = var.oidc_provider_name
}
