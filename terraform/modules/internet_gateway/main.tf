resource "aws_internet_gateway" "gw" {
  vpc_id = var.vpc_id

  tags = {
    Environment = var.environment_tag
  }

}