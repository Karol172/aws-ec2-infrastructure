variable "instance_type" {
  default = "t2.micro"
  type = string
  description = "The instance type of the launched EC2"
}

variable "ami_id" {
  type = string
  description = "AMI's id of the launched EC2"
}

variable "key_name" {
  type = string
  description = "AWS Key Pair"
}

variable "subnet_id" {
  type = string
  description = "Subnet's id for launched EC2"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}

variable "security_groups" {
  type = list
  description = "The list of security groups ids"
}
