variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr_block" {
  default = "10.0.0.0/16"
}

variable "public_cidr_block" {
  default = "10.0.0.0/24"
}

variable "private_cidr_block" {
  default = "10.0.1.0/24"
}

variable "azs" {
  default = "eu-central-1a"
}