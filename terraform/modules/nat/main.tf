resource "aws_eip" "nat" {
  vpc = true

  tags = {
    Environment = var.environment_tag
  }

}

resource "aws_nat_gateway" "nat-gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet_id
  depends_on    = [var.internet_gw]

  tags = {
    Environment = var.environment_tag
  }

}