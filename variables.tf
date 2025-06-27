variable "aws_region" {
  description = "AWS регион для развертывания"
  type = string
  default = "eu-west-1"
}

variable "vpc_cidr" {
  description = "CIDR блок для VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR блоки для публичных подсетей"
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "CIDR блоки для приватных подсетей"
  type = list(string)
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "project_name" {
  description = "Название проекта для тегов"
  type        = string
  default     = "k8s-cluster"
}

variable "environment" {
  description = "Окружение (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "bastion_instance_type" {
  description = "Тип инстанса для bastion хоста"
  type        = string
  default     = "t2.micro"
}

variable "enable_nat_gateway" {
  description = "Использовать NAT Gateway вместо NAT Instance"
  type        = bool
  default     = true
}

variable "enable_dns_hostnames" {
  description = "Включить DNS hostnames в VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Включить DNS support в VPC"
  type        = bool
  default     = true
}