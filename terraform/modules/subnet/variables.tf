variable "vpc_id" {
  type = number
  description = "Id of the VPC"
}

variable "cidr_block" {
  type = string
  default = "The CIDR block for subnet"
}