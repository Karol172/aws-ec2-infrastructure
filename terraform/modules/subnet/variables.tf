variable "vpc_id" {
  type = string
  description = "Id of the VPC"
}

variable "cidr_block" {
  type = string
  description = "The CIDR block for subnet"
}

variable "availability_zone" {
  type = string
  description = "The availability zone"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}
