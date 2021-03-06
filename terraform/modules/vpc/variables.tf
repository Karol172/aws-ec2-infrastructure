variable "cidr_block" {
  default = "10.0.0.0/16"
  type = string
  description = "The CIDR block for the VPC"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}
