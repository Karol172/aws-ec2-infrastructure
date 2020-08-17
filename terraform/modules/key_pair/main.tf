resource "tls_private_key" "public_key_generator" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "key_pair" {
  key_name = var.key_name
  public_key = tls_private_key.public_key_generator.public_key_openssh

  tags = {
    Environment = var.environment_tag
  }

}
