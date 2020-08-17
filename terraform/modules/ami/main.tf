data "aws_ami" "ami" {
  most_recent = true
  owners = [var.ubuntu_account_number]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  tags = {
    Environment = var.environment_tag
  }

}
