resource "aws_route_table_association" "rta_subnet_public" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.public_route_table_id
}

resource "aws_route_table_association" "rta_subnet_private" {
  subnet_id      = var.private_subnet_id
  route_table_id = var.private_route_table_id
}
