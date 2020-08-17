resource "aws_route_table" "route_table" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.gw_id
  }

  tags = {
    Environment = var.environment_tag
  }

}