resource "alicloud_market_order" "order" {
  product_code    = "cmapi033136"
  pay_type        = "prepay"
  quantity        = 1
  duration        = 1
  pricing_cycle   = "Month"
  package_version = "yuncode2713600001"
  coupon_id       = ""
}