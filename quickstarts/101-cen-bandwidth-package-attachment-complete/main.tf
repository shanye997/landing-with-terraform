resource "alicloud_cen_instance" "default" {
  name        = "tf-examplecn-hangzhouCenBandwidthPackageAttachment-3288190"
  description = "tf-exampleCenBandwidthPackageAttachmentDescription"
}

resource "alicloud_cen_bandwidth_package" "default" {
  cen_bandwidth_package_name = "tf-examplecn-hangzhouCenBandwidthPackageAttachment-3288190"
  bandwidth                  = 5
  geographic_region_a_id     = "China"
  geographic_region_b_id     = "China"
}

resource "alicloud_cen_bandwidth_package_attachment" "default" {
  bandwidth_package_id = alicloud_cen_bandwidth_package.default.id
  instance_id          = alicloud_cen_instance.default.id
}
