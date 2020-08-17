output "rsa-public-key" {
  value = tls_private_key.public_key_generator.private_key_pem
}

output "key_pair_name" {
  value = aws_key_pair.key_pair.key_name
}
