variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "The instance type of the launched EC2"
}

variable "ami_id" {
  type = number
  description = "AMI's id of the launched EC2"
}

variable "key_name" {
  type = number
  description = "AWS Key Pair"
}

variable "subnet_id" {
  type = number
  description = "Subnet's id for launched EC2"
}
