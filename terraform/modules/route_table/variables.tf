variable "vpc_id" {
  type = string
  description = "Id of the VPC"
}

variable "gw_id" {
  type = string
  description = "Id of the gateway"
}

variable "nat_gw_id" {
  type = string
  description = "Id of the NAT gateway"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}

