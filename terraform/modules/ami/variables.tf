variable "ubuntu_account_number" {
  default = "099720109477"
  type = string
  description = "The account number of AMI"
}

variable "environment_tag" {
  type = string
  description = "The environment tag"
}
