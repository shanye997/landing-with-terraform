provider "alicloud" {
  region = "cn-heyuan"

}
resource "alicloud_ebs_dedicated_block_storage_cluster" "default" {
  type                                 = "Premium"
  zone_id                              = "cn-heyuan-b"
  dedicated_block_storage_cluster_name = "dedicated_block_storage_cluster_name"
  total_capacity                       = 61440
}