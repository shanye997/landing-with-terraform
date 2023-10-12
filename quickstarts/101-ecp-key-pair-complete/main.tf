resource "alicloud_ecp_key_pair" "default" {
  public_key_body = var.public_key_body_var
  key_pair_name   = "tf-exampleAlicloudEcpKeyPair4737"
}
