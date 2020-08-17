variable "public_subnet_id" {
  type = string
  description = "Id of the public subnet"
}

variable "public_route_table_id" {
  type = string
  description = "Id of the public route table"
}

variable "private_subnet_id" {
  type = string
  description = "Id of the private subnet"
}

variable "private_route_table_id" {
  type = string
  description = "Id of the private route table"
}
