resource "alicloud_kms_application_access_point" "default" {
  policies = [
    "guaguagua",
    "efg",
    "hfc"
  ]
  application_access_point_name = "tf-examplecn-hangzhoukmsapplicationaccesspoint41951"
}
