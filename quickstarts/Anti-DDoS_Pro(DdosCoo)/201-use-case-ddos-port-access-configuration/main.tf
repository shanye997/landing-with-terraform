variable "region_id" {
  type    = string
  default = "cn-hangzhou"
}

# DDoS CoO 实例名称
variable "ddoscoo_instance_name" {
  description = "The name of the DDoS CoO instance"
  type        = string
  default     = "Ddoscootest" # 默认值
}

# 基础带宽
variable "base_bandwidth" {
  description = "Base bandwidth of the DDoS CoO instance"
  type        = string
  default     = "30" # 默认值
}

# 带宽
variable "bandwidth" {
  description = "Bandwidth of the DDoS CoO instance"
  type        = string
  default     = "40" # 默认值
}

# 服务带宽
variable "service_bandwidth" {
  description = "Service bandwidth of the DDoS CoO instance"
  type        = string
  default     = "100" # 默认值
}

# 端口数量
variable "port_count" {
  description = "Number of ports for the DDoS CoO instance"
  type        = string
  default     = "50" # 默认值
}

# 域名数量
variable "domain_count" {
  description = "Number of domains for the DDoS CoO instance"
  type        = string
  default     = "50" # 默认值
}

# 购买周期
variable "period" {
  description = "Purchase period of the DDoS CoO instance"
  type        = string
  default     = "1" # 默认值
}

# 产品类型
variable "product_type" {
  description = "Product type of the DDoS CoO instance"
  type        = string
  default     = "ddoscoo" # 默认值
}

# 计费模式
variable "pricing_mode" {
  description = "Pricing mode of the DDoS CoO instance (Prepaid or Postpaid)"
  type        = string
  default     = "Postpaid" # 默认值
}

# 前端端口
variable "frontend_port" {
  description = "The frontend port for the DDoS CoO port"
  type        = string
  default     = "7001"
}

# 后端端口
variable "backend_port" {
  description = "The backend port for the DDoS CoO port"
  type        = string
  default     = "7001"
}

# 前端协议
variable "frontend_protocol" {
  description = "The frontend protocol for the DDoS CoO port"
  type        = string
  default     = "tcp"
}

# 实际服务器列表
variable "real_servers" {
  description = "The list of real servers for the DDoS CoO port"
  type        = list(string)
  default     = ["196.128.10.21", "196.129.10.11"]
}

provider "alicloud" {
  region = var.region_id
}

resource "alicloud_ddoscoo_instance" "newInstance" {
  name              = var.ddoscoo_instance_name
  base_bandwidth    = var.base_bandwidth
  bandwidth         = var.bandwidth
  service_bandwidth = var.service_bandwidth
  port_count        = var.port_count
  domain_count      = var.domain_count
  period            = var.pricing_mode == "Prepaid" ? var.period : null
  product_type      = var.product_type
}

resource "alicloud_ddoscoo_port" "default" {
  instance_id       = alicloud_ddoscoo_instance.newInstance.id
  frontend_port     = var.frontend_port
  backend_port      = var.backend_port
  frontend_protocol = var.frontend_protocol
  real_servers      = var.real_servers
}

output "instance_id" {
  description = "The ID of the DDoS CoO instance"
  value       = alicloud_ddoscoo_instance.newInstance.id
}

output "instance_name" {
  description = "The name of the DDoS CoO instance"
  value       = var.ddoscoo_instance_name
}

output "port_id" {
  description = "The ID of the DDoS CoO port"
  value       = alicloud_ddoscoo_port.default.id
}
