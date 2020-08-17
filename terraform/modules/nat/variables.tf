variable "public_subnet_id" {
  type = string
  description = "Id of the public subnet"
}

variable "internet_gw" {
  description = "The internet gateway"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}